# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> $('document').ready( ->
	detectTitle()
	document.largeview = false
)

$ -> $('.title-input').focus( ->
	$this = $('.title-input')
	$this.val('') if $this.val() == "Please enter scene title..."
	detectTitle()
)

$ -> $('.title-input').blur( ->
	$this = $('.title-input')
	$this.val('Please enter scene title...') if $this.val() == ""
	detectTitle()
)

detectTitle = () ->
	$this = $('.title-input')
	$this.css({ 'color' : '#999999' }) if $this.val() == "Please enter scene title..."
	$this.css({ 'color' : '#000000' }) if $this.val() != "Please enter scene title..."

$ -> $('.edit-entry, #overlay').click( ->
	$el = $('.entry-field')
	$el.css({
		'left': -$('.edit-entry').offset().left + ($(window).width() / 100 * 5),
		'top': -$('.edit-entry').offset().top + 75,
	})
	if document.largeview == false
		$el.css({ 
			'width': $(window).width() / 100 * 90,
			'margin-bottom' : -$('.edit-entry').offset().top + 100
		})
		$('.edit-entry').text('Exit large view')
		$("#overlay").fadeIn()
		document.largeview = true
	else
		$el.css({ 'width' : '100%', 'margin-bottom' : '25px' })
		$('.edit-entry').text('Edit in large view')
		$("#overlay").fadeOut()
		document.largeview = false
)

resize = () ->
	if document.largeview == true
		$('.entry-field').css({ 
			'width' : '100%', 
			'margin-bottom' : '25px',
			'left': '0px',
			'top': '0px', 
		})
		$('.edit-entry').text('Edit in large view')
		$("#overlay").fadeOut()
		document.largeview = false

$ -> $(window).resize( ->
	setTimeout(resize, 10)
)
