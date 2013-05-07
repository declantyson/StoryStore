class StaticPagesController < ApplicationController
  def contact
  end

  def home
  	@projects = Project.all
  	@projects.sort!{|a, b| b.average_feedback_rating <=> a.average_feedback_rating}

    @recentprojects = Project.where(:privacy => false).order("created_at desc").limit(10)
    @inspiration = Inspiration.joins(:project).where("projects.privacy = ?", false).order("RANDOM()").limit(10)
  end

  def about
  end

  def help
  end
end
