# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  # 要素の高さを合わせる
  # $('body#mypage .left-content').height($('body#mypage .right-content').height())

  # bootstrap tabs, 表示したあとに要素の高さを合わせないと0になる..
  $("#profile-tab a").click (e) ->
    e.preventDefault()
    $(this).tab "show"
    $("body#mypage .left-content").height $("body#mypage .right-content").height()
  
  # 最初の要素を表示
  $("#profile-tab a:first").tab "show"
