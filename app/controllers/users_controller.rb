class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    redirect_to '/register', :status => :moved_permanently 
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if signed_in? && current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to "/"
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'Account created - welcome to StoryStore!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if params[:user][:change_password] == false
        @user.attributes = params[:user].except(:password, :password_confirmation, :change_password)
      else
        @user.attributes = params[:user].except(:change_password)
      end
      if @user.save(validate: false)
        sign_in @user
        format.html { redirect_to @user, notice: 'Your account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
    	@user.destroy
		end
    respond_to do |format|
	    format.html { redirect_to '/' }
	    format.json { head :no_content }
    end
  end

  def read
    current_user.notifications.each do |n|
      n.read = true
      n.save
    end
    render :text => "done"
  end
end
