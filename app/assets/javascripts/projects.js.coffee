# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.edit = false
window.scene = false

$ -> $('.edit-object, .box-group a').click( ->
	$group = $(this).closest('.box-group')
	window.scene = true if $group.hasClass('scene-boxes')
	window.edit = true if $(this).hasClass("edit-object")
	if window.edit == true and !$(this).hasClass("edit-object")
		return false
		
	target = $(this).closest('a').data('frame')
	target += "/edit" if $(this).hasClass("edit-object")
	target += $(this).closest('a').data('project')
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

$ -> $('.delete-object').click( ->
	del = confirm "Are you sure you want to delete this?"
	# delete code to go here
)

openFrame = (target) -> 
	if window.edit == true
		window.location.href = target
	else if window.scene == true and $(window).width() < 740
		window.location.href = target
	else
		$("#overlay").fadeIn()
		$(".frame-container").show().removeClass("bounceOutUp").addClass("bounceInDown")
		$('iframe').attr('src', target)

closeFrame = () -> 
	$("#overlay").fadeOut()
	$(".frame-container").removeClass("bounceInDown").addClass("bounceOutUp")
	window.edit = false; $('iframe').attr('src', '')
