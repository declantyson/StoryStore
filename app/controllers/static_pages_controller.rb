class StaticPagesController < ApplicationController
  def contact
  end

  def home
  	@projects = Project.all
  	@projects.sort!{|a, b| b.average_feedback_rating <=> a.average_feedback_rating}

    @recentprojects = Project.order("created_at desc").limit(10)

    @inspiration = Inspiration.order("RANDOM()").limit(10)
  end

  def about
  end

  def help
  end
end
