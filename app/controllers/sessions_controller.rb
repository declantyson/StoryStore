class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if request.xhr?
        render :text => "Success"
      else
        redirect_to user
      end
    else
      if request.xhr?
        render :text => "Invalid email/password combination"
      else
        flash.now[:error] = "Invalid email/password combination"
        render "new"
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
