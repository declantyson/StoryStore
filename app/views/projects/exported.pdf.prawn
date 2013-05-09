pdf.text "#{@project.title}", :size => 36, :style => :bold
pdf.text "by #{@project.user.name}", :size => 11, :style => :normal

if @params[:scenes]
	pdf.text "\n\n"
	@project.scenes.each do |s|
		pdf.text "#{s.name}\n", :size => 18
		pdf.image open("#{s.image.url.sub!(/\?.+\Z/, '')}")	if s.image.present?
		e = s.entry.sub("</p>", "\n\n")
		t = sanitize(e, :tags => {})
		pdf.text t
	end
end

if @params[:characters]
	pdf.start_new_page
	pdf.text "\nCharacters\n", :size => 25, :style => :bold
	@project.characters.each do |c|
		pdf.text "#{c.name}\n\n", :size => 18
		pdf.image open("#{c.image.url.sub!(/\?.+\Z/, '')}"), :width => 200 if c.image.present?
		pdf.text "\n#{c.personality}\n"
		pdf.text "\"#{c.quotes}\"\n", :style => :italic
	end
end

if @params[:locations]
	pdf.start_new_page
	pdf.text "\nLocations\n", :size => 25, :style => :bold
	@project.locations.each do |l|
		pdf.text "#{l.name}\n\n", :size => 18
		pdf.image open("#{l.image.url.sub!(/\?.+\Z/, '')}"), :width => 200  if l.image.present?
		pdf.text "\n#{l.description}\n\n"
	end
end

if @params[:music]
	pdf.start_new_page
	pdf.text "\nMusic\n", :size => 25, :style => :bold
	@project.musics.each do |m|
		pdf.text "#{m.name}\n\n", :size => 18
		pdf.image open("#{m.image.url.sub!(/\?.+\Z/, '')}"), :width => 200  if m.image.present?
		pdf.fill_color "0000aa"
		pdf.text "\n#{m.spotify_uri}\n\n", :size => 11
		pdf.fill_color "000000"
	end
end

if @params[:inspiration]
	pdf.start_new_page
	pdf.text "\nInspirations\n", :size => 25, :style => :bold
	@project.inspirations.each do |i|
		pdf.text "#{i.name}\n\n", :size => 18
		pdf.image open("#{i.image.url.sub!(/\?.+\Z/, '')}"), :width => 200  if i.image.present?
	end
end
