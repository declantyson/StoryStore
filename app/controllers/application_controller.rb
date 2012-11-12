class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  rescue_from ActiveRecord::RecordNotFound, :with => :throw_404

  def throw_404
  	return head :not_found
  end
end
