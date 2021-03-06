class MusicsController < ApplicationController
  # GET /musics
  # GET /musics.json
  def index
    return throw_404
    @musics = Music.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @musics }
    end
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @music = Music.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/new
  # GET /musics/new.json
  def new
    @music = Music.new
		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id
		  respond_to do |format|
		    format.html # new.html.erb
		    format.json { render json: @music }
		  end
		else
      redirect_to "/"
	 	end
  end

  # GET /musics/1/edit
  def edit
 		if signed_in? && Project.find(params[:pid]).user_id == User.find_by_remember_token(cookies[:remember_token]).id && Music.find(params[:id]).project_id == Project.find(params[:pid]).id
	    @music = Music.find(params[:id])
	  else
	  	redirect_to '/'
	  end
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(params[:music])
		@project = Project.find(@music.project_id)
    respond_to do |format|
      if @music.save
        format.html { redirect_to @project, notice: 'Music was successfully created.' }
        format.json { render json: @music, status: :created, location: @music }
      else
        format.html { render action: "new" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /musics/1
  # PUT /musics/1.json
  def update
    @music = Music.find(params[:id])
		@project = Project.find(@music.project_id)
    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to @project, notice: 'Music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music = Music.find(params[:id])
    @project = Project.find(@music.project_id)
    @owner = User.find(@project.user_id)
    if @owner.id == current_user.id
	    @music.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @project }
  	    format.json { head :no_content }
  	  end
  	else
	  	redirect_to "/"
  	end
  end
end
