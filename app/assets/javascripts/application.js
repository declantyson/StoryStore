// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require redactor-rails

$(document).ready(function(){
	setTimeout(function(){ $('.alert').css({ opacity: 0 }); }, 2500);
	$('.notifications').click(function(){
		$('.notifications-box').slideToggle(150);
		if($(this).data('read') != "true") {
			$.ajax({
				url: "/read_notifications",
				type: "get"
			});
			setTimeout(function(){
				$('.notifications').css({ color: "#cccccc" });
				$('.notifications-box li a').css({ "font-weight" : "normal" })
			}, 3000);
			$(this).data("read", "true");
		}
	});
});
