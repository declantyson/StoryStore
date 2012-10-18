# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.edit = false

$ -> $('.edit-object, .box-group a').click( ->
	window.edit = true if $(this).hasClass("edit-object")
	if window.edit == true and !$(this).hasClass("edit-object")
		return false
		
	target = $(this).closest('a').data('frame')
	target += "/edit" if $(this).hasClass("edit-object")
	target += $(this).closest('a').data('project')
	target += "&lightbox=true"
	openFrame(target) 
)

$ -> $('#overlay, .close-frame').click( ->
	closeFrame()
)

$ -> $(window).keydown((e) ->
	closeFrame() if e.keyCode == 27
)

openFrame = (target) -> console.log(target);$("#overlay").fadeIn(); $(".frame-container").show().removeClass("bounceOutUp").addClass("bounceInDown"); $('iframe').attr('src', target)

closeFrame = () -> $("#overlay").fadeOut(); $(".frame-container").removeClass("bounceInDown").addClass("bounceOutUp"); window.edit = false; $('iframe').attr('src', '')
