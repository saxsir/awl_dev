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
//= require jquery.ui.all
//= require twitter/bootstrap
//= require_tree .
//add
//= require grid-a-licious/jquery.grid-a-licious.min.js
//= require iosSlider/jquery.iosslider.min.js
//= require jglycy/jglycy-1.0.min.js
//= require jtruncsubstr/jquery.jtruncsubstr-1.0rc.min.js
//= require jquery-easing/jquery.easing.1.3.js
//= require jquery.numeric/jquery.numeric.js

$(function(){
	var form_tag = '<form accept-charset="UTF-8" action="/users/sign_in" class="new_user" id="new_user" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><label for="user_login">Login</label><input class="span2" id="user_login" name="user[login]" size="15" type="text" /><label for="user_password">Password</label><input class="span2" id="user_password" name="user[password]" size="15" type="password" /><br><input name="user[remember_me]" type="hidden" value="0" /><input type = "hidden"id="user_remember_me" name="user[remember_me]" type="checkbox" value="1" checked /><input class="btn btn-primary pull-right" name="commit" type="submit" value="Sign in" /></form>';


	$("#nav_login").popover({
		html:true,
		offset: 5,
		placement: 'bottom',
		title: "ログイン",
		content: form_tag
	});
	$('#nav_login').die('mouseleave');
});