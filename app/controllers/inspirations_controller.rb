class InspirationsController < ApplicationController
  # GET /inspirations
  # GET /inspirations.json
  def index
    return head :not_found
    @inspirations = Inspiration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inspirations }
    end
  end

  # GET /inspirations/1
  # GET /inspirations/1.json
  def show
    @inspiration = Inspiration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inspiration }
    end
  end

  # GET /inspirations/new
  # GET /inspirations/new.json
  def new
    @inspiration = Inspiration.new
    if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @inspiration }
      end
    else
      redirect_to "/"
    end
  end

  # GET /inspirations/1/edit
  def edit
    if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id && Inspiration.find(params[:id]).project_id == Project.find(params[:pid]).id
      @inspiration = Inspiration.find(params[:id])
    else
      redirect_to "/"
    end
  end

  # POST /inspirations
  # POST /inspirations.json
  def create
    @inspiration = Inspiration.new(params[:inspiration])
    @project = Project.find(@inspiration.project_id)
    respond_to do |format|
      if @inspiration.save
        format.html { redirect_to @project, notice: 'Inspiration was successfully created.' }
        format.json { render json: @inspiration, status: :created, inspiration: @inspiration }
      else
        format.html { render action: "new" }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inspirations/1
  # PUT /inspirations/1.json
  def update
    @inspiration = Inspiration.find(params[:id])

    respond_to do |format|
      if @inspiration.update_attributes(params[:inspiration])
        format.html { redirect_to @inspiration, notice: 'Inspiration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inspiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspirations/1
  # DELETE /inspirations/1.json
  def destroy
    @inspiration = Inspiration.find(params[:id])
    @project = Project.find(@inspiration.project_id)
    @owner = User.find(@project.user_id)
    if @owner.id == current_user.id
	    @inspiration.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @project }
  	    format.json { head :no_content }
  	  end
  	else
	  	redirect_to "/"
  	end
  end
end
