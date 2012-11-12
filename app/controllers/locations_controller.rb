class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    return throw_404
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new
		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @location }
      end
    else
      redirect_to "/"
	 	end
  end

  # GET /locations/1/edit
  def edit
 		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id && Location.find(params[:id]).project_id == Project.find(params[:pid]).id
	    @location = Location.find(params[:id])
	  else
	  	redirect_to "/"
	  end
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])
		@project = Project.find(@location.project_id)
    respond_to do |format|
      if @location.save
        format.html { redirect_to @project, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])
		@project = Project.find(@location.project_id)
    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @project, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @project = Project.find(@location.project_id)
    @owner = User.find(@project.user_id)
    if @owner.id == current_user.id
	    @location.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @project }
  	    format.json { head :no_content }
  	  end
  	else
	  	redirect_to "/"
  	end
  end
end
