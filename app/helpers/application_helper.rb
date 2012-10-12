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

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "StoryStore"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def get_genre_dropdown()
    collection_select("project", "genres", genre_list(), :first, :last, {:prompt => "Please select"})
  end

end
