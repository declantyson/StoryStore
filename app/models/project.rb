# == Schema Information
#
# Table name: projects
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  user_id                :integer
#  synopsis               :string(255)
#  genres                 :string(255)
#  format                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  thumbnail_file_name    :string(255)
#  thumbnail_content_type :string(255)
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  privacy                :boolean          default(FALSE)
#

class Project < ActiveRecord::Base
  attr_accessible :format, :genres, :synopsis, :title, :user_id, :thumbnail, :privacy
  belongs_to :user
  has_many :characters
  has_many :scenes
  has_many :locations
  has_many :musics
  has_many :inspirations
  has_many :feedbacks

  validates :title, presence: true, length: {minimum: 4, maximum: 255}
  validates :genres, presence: true
  validates :format, presence: true
  validates :synopsis, length: { maximum: 255 }
  before_save validate :validate_proj_thumbnail
  has_attached_file :thumbnail, styles: { medium: "300x300>", thumb: "100x100>" }

  def feedback_rating
    total = 0.0
    self.feedbacks.each do |f|
      total += f.rating
    end
    avg = total / self.feedbacks.size
  end  

  def average_feedback_rating
    return 0 if self.feedback_rating.nan?
    feedback_rating.to_i
  end

  def total_feedback_rating
    average_feedback_rating.round(2)
  end

  def validate_proj_thumbnail
     if self.thumbnail.queued_for_write[:original]
      dimensions = Paperclip::Geometry.from_file(self.thumbnail.queued_for_write[:original])
      self.errors.add(:thumbnail, "should be at least 165px wide") if dimensions.width < 165
     end
  end
  
  def get_thumbnail()
    avatar_html = "<img src='#{self.thumbnail.url(:original)}'/>"
    avatar_html.html_safe
  end

  def get_feedback
    a = []
    self.feedbacks.each do |f|
      a << "<span data-frame='/feedbacks/#{f.id}' data-project='?pid=#{self.id}'><div class='box populated-box'>"
      (1..f.rating).each { |r| a << "<span class='star active'></span>" }
      a << "<div class='title'><p><span class='object-title'>#{f.headline}</span></p></div></div></span>"
    end
    a.join.html_safe
  end

  def get_music(signed_in)
    a = []
    self.musics.each do |m|
      if !m.spotify_uri.blank?
        edit = "<a href='#{m.spotify_uri}'><i class='icon-play icon-white' title='Play in spotify'></i></a>&nbsp;<a href='/musics/#{m.id}/edit?pid=#{self.id}'><i class='icon-pencil icon-white edit-object' title='Edit'></i></a><a href='/'#{m.id}' data-confirm='Are you sure you want to delete #{m.name}?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white delete-object' title='Delete'></i></a>" if signed_in
        a << "<span data-frame='/musics/#{m.id}' data-project='?pid=#{self.id}'><div class='box populated-box'><a href='#{m.spotify_uri}'><img src='/assets/spotify-play.png' class='spotify-play-button'/></a><div class='title' style='cursor:default'><p><span class='object-title'>#{m.name}</span> #{edit}</p></div><img src='#{m.image.url}' alt='#{m.name}'/></div></span>"
      else
        edit = "<i class='icon-search icon-white view-object' title='View'></i>&nbsp;<i class='icon-pencil icon-white edit-object' title='Edit'></i><a href='/'#{m.id}' data-confirm='Are you sure you want to delete #{m.name}?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white delete-object' title='Delete'></i></a>" if signed_in
        a << "<span data-frame='/musics/#{m.id}' data-project='?pid=#{self.id}'><div class='box populated-box'><div class='title'><p><span class='object-title'>#{m.name}</span> #{edit}</p></div><img src='#{m.image.url}' alt='#{m.name}'/></div></span>"
      end  
    end
    a.join.html_safe
  end
   
  def get_thing(thing, signed_in)
    a = []
    self.send(thing.to_sym).each_index do |i|
      if signed_in
  	  	edit = "<i class='icon-search icon-white view-object' title='View'></i>&nbsp;<i class='icon-pencil icon-white edit-object' title='Edit'></i><a href='/#{thing}/#{self.send(thing.to_sym)[i].id}' data-confirm='Are you sure you want to delete #{self.send(thing.to_sym)[i].name}?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white delete-object' title='Delete'></i></a>"
	    end
		  img = "<img src='#{self.send(thing.to_sym)[i].image.url}' alt='#{self.send(thing.to_sym)[i].name}'/>"
      a << "<span data-frame='/#{thing}/#{self.send(thing.to_sym)[i].id}' data-project='?pid=#{self.id}'><div class='box populated-box'>#{img}<div class='title'><p><span class='object-title'>#{self.send(thing.to_sym)[i].name}</span> #{edit}</p></div></div></span>"
    end
    a.join.html_safe
  end

  def private?
    self.privacy
  end
end
