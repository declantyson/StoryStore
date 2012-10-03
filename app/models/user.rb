class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :projects
  has_many :feedbacks

  #Gets a list of projects by user
  def get_projects()
    a = []
    self.projects.each_index do |i|
      # a << content_tag(:p, self.projects[i].title)
      a << "#{self.projects[i].title}<br/>"
    end
    a.join.html_safe
  end

end
