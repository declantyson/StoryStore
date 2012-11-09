# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> $('.input-star').mouseover( ->
	val = $(this).data('value')
	$('.input-star').each( ->
		if $(this).data('value') <= val
			$(this).addClass('temp-active')
		else
			$(this).addClass('temp-inactive')
	)
)

$ -> $('.input-star').mouseout( ->
	$('.input-star').each( -> 
		$(this).removeClass('temp-active temp-inactive')
	)
)

$ -> $('.input-star').click( ->
	val = $(this).data('value')
	$('#feedback_rating').val(val)
	$('.input-star').each( ->
		$(this).removeClass('active inactive')
		if $(this).data('value') <= val
			$(this).addClass('active')
		else
			$(this).addClass('inactive')
	)
)
