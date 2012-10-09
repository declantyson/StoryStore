# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  email               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  password_digest     :string(255)
#  avatar              :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  remember_token      :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
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
      img = "<img src='#{self.projects[i].thumbnail.url}' alt='#{self.projects[i].title}'/>"
      a << "<a href='/projects/#{self.projects[i].id}'><div class='box populated-box'>#{img}<div class='title'><p>#{self.projects[i].title}</p></div></div></a>"
    end
    a.join.html_safe
  end

  def get_avatar()
    if self.avatar.url == "/avatars/original/missing.png"
      avatar_html = '<div class="blank"></div>'
    else 
      avatar_html = "<img src='#{self.avatar.url}' alt='#{self.name}'/>"
    end
    avatar_html.html_safe
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
