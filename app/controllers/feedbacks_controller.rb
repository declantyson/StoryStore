class FeedbacksController < ApplicationController
  # GET /feedbacks
  # GET /feedbacks.json
  def index
    return throw_404
    @feedbacks = Feedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @feedback = Feedback.new
    @project = Project.find(params[:pid])

    if signed_in? && @project.user.id == current_user.id
      redirect_to @project, flash: { error: "You can't leave feedback on your own work!" }
      return
    end

    prev_feedback = Feedback.where('project_id = ? AND user_id = ?', params[:pid], current_user.id).order("created_at desc")

    if !prev_feedback.first.nil? && prev_feedback.first.created_at >= 1.day.ago
      redirect_to @project, flash: { error: "You've already left feedback on this project today. Come back tomorrow and give the author a chance to change things." }
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/1/edit
  def edit
    redirect_to "/"
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(params[:feedback])
    @project = Project.find(@feedback.project_id)
    respond_to do |format|
      if @feedback.save
        FeedbackNotifier.feedback_email(@project.user).deliver
        format.html { redirect_to @project, notice: 'Feedback was successfully created.' }
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @feedback = Feedback.find(params[:id])
    
    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    redirect_to "/"
    return

    @feedback = Feedback.find(params[:id])
    @owner = User.find(@feedback.user_id)
    if @owner.id == current_user.id
	    @feedback.destroy
	
  	  respond_to do |format|
  	    format.html { redirect_to @owner }
  	    format.json { head :no_content }
  	  end
  	end
  end
end
