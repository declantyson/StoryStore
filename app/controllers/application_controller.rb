class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  rescue_from ActiveRecord::RecordNotFound, :with => :throw_404
  rescue_from ActionController::RoutingError, :with => :throw_404

  def throw_404
    render :template => 'error_pages/404', :layout => false, :status => :not_found  
  end
end
