class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :projects
  has_many :feedbacks
end
