// Utility functions because JS sucks 
// and misses some pretty basic functions

function getTodaysDate() {
	var monthNames = [
	  "January", "February", "March",
	  "April", "May", "June", "July",
	  "August", "September", "October",
	  "November", "December"
	];

	var date = new Date();
	var day = date.getDate();
	var monthIndex = date.getMonth();
	var year = date.getFullYear();

	return day + ' ' + monthNames[monthIndex] + ' ' + year;
}

function validateEmail(email) { 	
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 

function validatePassword(password) {
	var valid = true;
	var errorText = "";
	if(password.length < 8) {
		valid = false;
		errorText += "<li>Your password must be at least 8 letters long.</li>";
	}
	if(password.search(/[A-Z]/) < 0) {
		valid = false;
		errorText += "<li>Your password must contain at least one upper case letter.</li>";
	}
	if(password.search(/[a-z]/) < 0) {
		valid = false;
		errorText += "<li>Your password must contain at least one lower case letter.</li>";
	}
	if(password.search(/[0-9]/i) < 0) {
		valid = false;
		errorText += "<li>Your password must contain at least one number.</li>";
	}
	return [valid, errorText];
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function setCookie(cname, cvalue, exmins) {
    var d = new Date();
    d.setTime(d.getTime() + (exmins*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

function deleteCookie(name) {
	document.cookie = name +
	'=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
}