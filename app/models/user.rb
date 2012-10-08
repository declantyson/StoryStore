# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
	before_save { |user| user.email = email.downcase }
	validates :name, presence: true, length: {minimum: 4, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
 	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
  has_many :projects
  has_many :feedbacks

  #Gets a list of projects by user
  def get_projects()
    a = []
    self.projects.each_index do |i|
      # a << content_tag(:p, self.projects[i].title)
      a << "<a href='/projects/#{self.projects[i].id}'><div class='box populated-box'><div class='title'><p>#{self.projects[i].title}</p></div></div></a>"
    end
    a.join.html_safe
  end

end
