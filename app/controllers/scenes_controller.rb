class ScenesController < ApplicationController
  # GET /scenes
  # GET /scenes.json
  def index
    return throw_404
    @scenes = Scene.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scenes }
    end
  end

  # GET /scenes/1
  # GET /scenes/1.json
  def show
    @scene = Scene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scene }
    end
  end

  # GET /scenes/new
  # GET /scenes/new.json
  def new
		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id
		  @scene = Scene.new
		  respond_to do |format|
		    format.html # new.html.erb
		    format.json { render json: @scene }
		  end
    else
	  	redirect_to "/"
    end
  end

  # GET /scenes/1/edit
  def edit
   	if signed_in? &&  Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id && Scene.find(params[:id]).project_id == Project.find(params[:pid]).id
    	@scene = Scene.find(params[:id])
    else
	  	redirect_to "/"
	  end
  end

  # POST /scenes
  # POST /scenes.json
  def create
    @scene = Scene.new(params[:scene])
		@project = Project.find(@scene.project_id)
    respond_to do |format|
      if @scene.save
        format.html { redirect_to @project, notice: 'Scene was successfully created.' }
        format.json { render json: @scene, status: :created, location: @scene }
      else
        format.html { render action: "new" }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scenes/1
  # PUT /scenes/1.json
  def update
    @scene = Scene.find(params[:id])
		@project = Project.find(@scene.project_id)
    respond_to do |format|
      if @scene.update_attributes(params[:scene])
        format.html { redirect_to @project, notice: 'Scene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenes/1
  # DELETE /scenes/1.json
  def destroy
    @scene = Scene.find(params[:id])
    @project = Project.find(@scene.project_id)
    @owner = User.find(@project.user_id)
    if @owner.id == current_user.id
	    @scene.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @project }
  	    format.json { head :no_content }
  	  end
  	else
	  	redirect_to "/"
  	end
  end
end
