function addEmptyBoxes(){
	var mainWidth, maxNoOfBoxes, currentBoxes, boxWidth,
		winWidth = $(window).width();
	$('.title').hide();
	if(winWidth > 740) {
		$('#project-details').css({ 
			'min-height' : $('.content').height()
		});
		boxWidth = 185;
		mainWidth = $('.content').width() - 350;
		$('.synopsis').show();
	} else if (winWidth > 380) {
		$('#project-details').css({ 
			'min-height' : 320
		});
		boxWidth = 170;
		mainWidth = $('.content').width();
		$('.synopsis').hide();
	} else {
		$('.title').show();
	}

	maxNoOfBoxes = Math.floor(mainWidth / boxWidth);

	$('.empty-box').remove();
	$('.box-group').each(function(){
		var newMax;
		currentBoxes = 0;
		$(this).find('.populated-box').each(function(){
			currentBoxes++;
		});
		if(currentBoxes < maxNoOfBoxes) {
			for(i = currentBoxes; i < maxNoOfBoxes; i++) {
				$(this).append('<div class="box empty-box"></div>');
			}
		} else {
			newMax = Math.ceil(currentBoxes / maxNoOfBoxes) * maxNoOfBoxes;
			console.log(newMax);
			for(i = currentBoxes; i < newMax; i++) {
				$(this).append('<div class="box empty-box"></div>');
			}
		}
	});
}

addEmptyBoxes();

$(document).ready(function(){
	addEmptyBoxes();
	$(window).on('resize', function(){
		addEmptyBoxes();
	});

	$('.show-synopsis').on('click', function(){
		$('.synopsis').toggle();
	});

	$('.populated-box').hover(function() {
		if($(window).width() > 380) {
			$(this).find('.title').fadeIn();
		}
	}, function(){
		if($(window).width() > 380) {
			$(this).find('.title').fadeOut();
		}
	});
});



