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
#  change_password     :boolean
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :avatar, :change_password
  has_attached_file :avatar, styles: { medium: "320x1000>", thumb: "165x165>" }
  before_save validate :validate_avatar
  has_secure_password
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :name, presence: true, length: {minimum: 4, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :projects, :dependent => :destroy
  has_many :feedbacks, :dependent => :destroy
  has_many :notifications

  #Gets a list of projects by user
  def get_projects()
    a = []
    self.projects.each_index do |i|
      img = "<img src='#{self.projects[i].thumbnail.url}' alt='#{self.projects[i].title}'/>"
      a << "<a href='/projects/#{self.projects[i].id}'><div class='box populated-box'>#{img}<div class='title'><p><span class='object-title'>#{self.projects[i].title}</span></p></div></div></a>"
    end
    a.join.html_safe
  end

  def get_avatar()
    if self.avatar.url == "/avatars/original/missing.png"
      avatar_html = '<div class="blank"></div>'
    else 
      avatar_html = "<img src='#{self.avatar.url(:medium)}'/>"
    end
    avatar_html.html_safe
  end

  def get_avatar_thumb()
    if self.avatar.url == "/avatars/original/missing.png"
      avatar_html = '<div class="blank"></div>'
    else 
      avatar_html = "<img src='#{self.avatar.url(:thumb)}'/>"
    end
    avatar_html.html_safe
  end
  
  # make sure that avatar uploaded is at least 320 px
  def validate_avatar
     if self.avatar.queued_for_write[:original]
      # self.errors.add(:change_pass)
      dimensions = Paperclip::Geometry.from_file(self.avatar.queued_for_write[:original])
      self.errors.add(:avatar, "should at least 320px") if dimensions.width > 320
     end
  end

  def unread_notifications_count
    a = []
    self.notifications.each do |n|
      a << n if !n.read
    end
    a.count
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
