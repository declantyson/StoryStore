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
    genres["other"] = "Other"
    genres
  end

  # list of formats
  def format_list()
    formats = {}
    formats["book"] = "Book"
    formats["animation"] = "Animation"
    formats["film"] = "Film"
    formats["play"] = "Play"
    formats["game"] = "Game"
    formats["other"] = "Other"
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

end
