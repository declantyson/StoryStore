class Blog < ActiveRecord::Base
  attr_accessible :content, :title

  def get_thing(thing, signed_in)
    a = []
    Blog.all.each do |i|
      if signed_in
  	  	# edit = "<i class='icon-search icon-white view-object' title='View'></i>&nbsp;<i class='icon-pencil icon-white edit-object' title='Edit'></i><a href='/#{i.id}' data-confirm='Are you sure you want to delete #{self.send(thing.to_sym)[i].name}?' data-method='delete' rel='nofollow'><i class='icon-trash icon-white delete-object' title='Delete'></i></a>"
	  end
	  img = '<img src="/thumbnails/original/missing.png">'
      a << "<span data-frame='/blogs/#{i.id}' data-project='?pid='><div class='box populated-box'>#{img}<div class='title'><p><span class='object-title'>#{i.title}</span></p></div></div></span>"
    end
    a.join.html_safe
  end
end
