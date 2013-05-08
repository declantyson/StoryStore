# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.edit = false
window.scene = false
window.delete = false

$ -> $('.edit-object, .delete-object, .box-group span').click( ->
	$group = $(this).closest('.box-group')
	window.scene = true if $group.hasClass('scene-boxes')
	window.edit = true if $(this).hasClass("edit-object")
	window.delete = true if $(this).hasClass("delete-object")
	
	if window.edit == true and !$(this).hasClass("edit-object")
		return false
		
	if window.delete == true and !$(this).hasClass("delete-object")
		window.delete = false
		return
		
	target = $(this).closest('span').data('frame')
	target += "/edit" if $(this).hasClass("edit-object")
	target += $(this).closest('span').data('project')
	if !$(this).hasClass("edit-object")
		target += "&lightbox=true"
	openFrame(target)
)

$ -> $('#overlay, .close-frame').click( ->
	closeFrame()
)

$ -> $(window).keydown((e) ->
	closeFrame() if e.keyCode == 27
)

$ -> $('i.icon-remove').live("click", ( ->
		$(this).closest('.tag').remove()
	)
)

$ -> $('.suggested .tag').click( -> 
	$this = $(this)
	$this.parent().siblings('.tag-input').find('input[type=text]').before($this.clone().append('<i class="icon-remove"></i>'))
)

$ -> $('input#genre-tag, input#format-tag').focus( ->
	$this = $(this)
	$this.keydown((e) ->
		if $this.val() == "" and e.keyCode == 8
			$this.closest('.tag-input').find('.tag').last().remove();
		else if e.keyCode == 188 or e.keyCode == 191 or e.keyCode == 13 or e.keyCode == 9
			e.preventDefault();
			if $this.val() != ""
				v = $this.val()
				$this.before('<span class="tag"><a href="/tag/' + v + '">' + v + '</a><i class="icon-remove"></i></span>').val('')
	)
)

$ -> $('form.edit_project, form.new_project').submit((e) ->
	$('#project_genres, #project_format').val('')
	$('.tag-input').each( -> 
		$text = $(this).find('input[type=text]')
		if $text.val() != ""
			v = $text.val()
			$text.before('<span class="tag"><a href="/tag/' + v + '">' + v + '</a><i class="icon-remove"></i></span>').val('')
	)
	$('.tag').each( ->
		$this = $(this)
		$field = $(this).closest('.tag-input').find('input[type=hidden]')
		if $this.text() != ""
			$field.val($field.val() + $this.text() + ",")
	)
)

openFrame = (target) ->
	if window.edit == true
		window.location.href = target
	else if window.scene == true and $(window).width() < 740
		window.location.href = target
	else if window.delete == false
		$("#overlay").fadeIn()
		$(".frame-container").show().removeClass("bounceOutUp").addClass("bounceInDown")
		$('.frame').attr('src', target)
	else
		return

closeFrame = () -> 
	$("#overlay").fadeOut()
	$(".frame-container").removeClass("bounceInDown").addClass("bounceOutUp")
	window.edit = false; $('.frame').attr('src', '')


$ -> $('.spotify-play-button').mouseover( ->
	$(this).fadeTo(100, 1)
)

$ -> $('.spotify-play-button').mouseout( ->
	$(this).fadeTo(100, 0.8)
)