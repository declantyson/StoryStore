class CharactersController < ApplicationController
  # GET /characters
  # GET /characters.json
  def index
    return head :not_found
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id
	    @character = Character.new
    	respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @character }
    	end
    else
	  	redirect_to "/"
    end
  end

  # GET /characters/1/edit
  def edit
 		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id && Character.find(params[:id]).project_id == Project.find(params[:pid]).id
	    @character = Character.find(params[:id])
	  else
	  	redirect_to "/"
	  end
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])
		@project = Project.find(@character.project_id)
    respond_to do |format|
      if @character.save
        format.html { redirect_to @project, notice: 'Character was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find(params[:id])
		@project = Project.find(@character.project_id)
    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to @project, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @project = Project.find(@character.project_id)
    @owner = User.find(@project.user_id)
    if @owner.id == current_user.id
	    @character.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @project }
  	    format.json { head :no_content }
  	  end
  	else
	  	redirect_to "/"
  	end
  end
end
