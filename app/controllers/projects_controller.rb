include ActionView::Helpers::SanitizeHelper
class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    redirect_to "/"
    return

    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @owner = User.find(@project.user_id)

    if signed_in?
      if @owner.id != current_user.id && @project.private?
        throw_403
        return
      end
    else
      if @project.private?
        throw_403
        return
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/export
  def export
    @project = Project.find(params[:id])
    @owner = User.find(@project.user_id)

    if signed_in?
      if @owner.id != current_user.id
        throw_403
        return
      end
    end

    respond_to do |format|
      format.html # export.html.erb
      format.json { render json: @project }
    end
  end

  def exported
    @project = Project.find(params[:id])
    @owner = User.find(@project.user_id)
    @params = params

    respond_to do |format|
      format.pdf { 
        if @owner.id != current_user.id
          redirect_to "/"
        else
          render :layout => false 
        end
      }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    if signed_in?
      @project = Project.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @project }
      end
    else 
      redirect_to "/"
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    redirect_to "/" if !signed_in? || @project.user_id != User.find_by_remember_token(cookies[:remember_token]).id
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @owner = User.find(@project.user_id)
    if @owner.id == current_user.id
	    @project.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @owner }
  	    format.json { head :no_content }
  	  end
  	else
	  	redirect_to "/"
  	end
  end

  def tags
    field = params[:type]
    @tag = params[:tag].sub("_", " ")
    @projects = Project.all(:conditions => ["lower(#{field}) like ?", "%#{@tag}%".downcase])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end
end
