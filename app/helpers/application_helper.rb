module ApplicationHelper
  
  # list of genres
  def genre_list()
    genres = {}
    genres["aa"] = "Action/Adventure"
    genres["comedy"] = "Comedy"
    genres["crime"] = "Crime/Mystery"
    genres["drama"] = "Drama/Romance"
    genres["historical"] = "Historical"
    genres["horror"] = "Horror"
    genres["nf"] = "Non-fiction/Biographical"
    genres["scifi"] = "Sci Fi/Fantasy"
    genres["thriller"] = "Thriller"
    genres
  end

  # list of formats
  def format_list()
    formats = {}
    formats["book"] = "Book"
    formats["animation"] = "Animation"
    formats["film"] = "Film"
    formats["play"] = "Play"
    formats["poetry"] = "Poetry"
    formats["novella"] = "Novella"
    formats["game"] = "Game"
    formats
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "StoryStore"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Generate a dropdown form based on the genre_list()
  def get_genre_dropdown()
    collection_select("project", "genres", genre_list(), :first, :last, {:prompt => "Please select"})
  end

  # Generate a dropdown form based on the format_list()
  def get_format_dropdown()
    collection_select("project", "format", format_list(), :first, :last, {:prompt => "Please select"})
  end
  
  
  # Looks up index of genre or format list based on given string
  def lookup_genre(s)
  	g = genre_list()
  	g[s]
  end
  
  def lookup_format(s)
  	f = format_list()
  	f[s]
  end

  # Convert genres to tags
  def tag_gen(s, f, d = nil, l = true)
    return if s.nil?
    s = s.split(/[,\/]/)
    tags = []
    del = "<i class='icon-remove'></i>" if d
    s.each do |string|
      if l
        formatted_string = string.sub(" ", "_").downcase
        link = "<a href='/tags/#{f}/#{formatted_string}'>#{string}</a>"
      else
        link = string
      end
      tags << "<span class='tag'>#{link}#{del}</span>"
    end
    tags.join.html_safe
  end

  def suggested_formats(l = nil)
    tag_gen format_list().map{|k,v| "#{v}"}.join(','), "format", nil, l
  end  

  def suggested_genres(l = nil)
    tag_gen genre_list().map{|k,v| "#{v}"}.join(','), "genres", nil, l
  end
end
