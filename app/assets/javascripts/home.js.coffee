# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.carousel').carousel('cycle')

$ ->
  login_form_tag_home = "<form accept-charset=\"UTF-8\" action=\"/users/sign_in\" class=\"new_user\" id=\"new_user\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><label for=\"user_login\">Login</label><input class=\"span2\" id=\"user_login\" name=\"user[login]\" size=\"15\" type=\"text\" /><label for=\"user_password\">Password</label><input class=\"span2\" id=\"user_password\" name=\"user[password]\" size=\"15\" type=\"password\" /><br><input name=\"user[remember_me]\" type=\"hidden\" value=\"0\" /><input type = \"hidden\"id=\"user_remember_me\" name=\"user[remember_me]\" type=\"checkbox\" value=\"1\" checked /><input class=\"btn btn-primary pull-right\" name=\"commit\" type=\"submit\" value=\"Sign in\" /></form>" # Type here!
  $("#nav_login_home").popover
    html: true
    offset: 5
    placement: get_popover_placement
    title: "ログイン"
    content: "<form accept-charset=\"UTF-8\" action=\"/users/sign_in\" class=\"new_user\" id=\"new_user\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><label for=\"user_login\">Login</label><input class=\"span2\" id=\"user_login\" name=\"user[login]\" size=\"15\" type=\"text\" /><label for=\"user_password\">Password</label><input class=\"span2\" id=\"user_password\" name=\"user[password]\" size=\"15\" type=\"password\" /><br><input name=\"user[remember_me]\" type=\"hidden\" value=\"0\" /><input type = \"hidden\"id=\"user_remember_me\" name=\"user[remember_me]\" type=\"checkbox\" value=\"1\" checked /><input class=\"btn btn-primary pull-right\" name=\"commit\" type=\"submit\" value=\"Sign in\" /></form>"

# ウィンドウがある程度スクロールされていたらplacementをbottomにする
get_popover_placement = (dom_el)->
	scroll = $(window).scrollTop();
	#console.log(scroll)
	return "bottom" if scroll > 220
	return "top"