class StaticPagesController < ApplicationController
  def contact
  end

  def home
  	@projects = Project.all
  	@projects.sort!{|a, b| b.average_feedback_rating <=> a.average_feedback_rating}
  end

  def about
  end

  def help
  end
end
