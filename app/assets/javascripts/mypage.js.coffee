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

  # modal
  $("#modal-confirm").modal
  $("#nav_login_home").popover
    html: true
    offset: 5
    placement: "bottom"
    title: "ログイン"
    content: "<form accept-charset=\"UTF-8\" action=\"/users/sign_in\" class=\"new_user\" id=\"new_user\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><label for=\"user_login\">Login</label><input class=\"span2\" id=\"user_login\" name=\"user[login]\" size=\"15\" type=\"text\" /><label for=\"user_password\">Password</label><input class=\"span2\" id=\"user_password\" name=\"user[password]\" size=\"15\" type=\"password\" /><br><input name=\"user[remember_me]\" type=\"hidden\" value=\"0\" /><input type = \"hidden\"id=\"user_remember_me\" name=\"user[remember_me]\" type=\"checkbox\" value=\"1\" checked /><input class=\"btn btn-primary pull-right\" name=\"commit\" type=\"submit\" value=\"Sign in\" /></form>"



  # 編集するボタンが押される
  $("#edit-button").click ->
    $("#fileLoader").show("blind",10)
    $("#edit-button").hide("blind",10)
    $("#save-button").show("blind",10)
    $("#edit-subscription").text("編集が終了したら「保存する」ボタンを押して下さい！")
    $("#profile-image-subscription").text("アイコンは画像ファイルをドラッグ&ドロップすることでもアップロード出来ます。")
	  # マイページ編集をWYSIWYGに
    $(".editable").freshereditor("edit", true)


  # 保存するボタンが押される
  $("#save-button").click ->
    $("#modal-email").text($(".editable#email").text())
    $("#modal-username").text($(".editable#username").text())

	# 変更するボタンが押される
  $("#change-button").click	->
    $("#fileLoader").hide("blind",10)
    $("#save-button").hide("blind",10)
    $("#edit-button").show("blind",10)
    $("#edit-subscription").text("「編集する」ボタンを押すと、ユーザー情報をクリックして編集可能になります！")
    $("#profile-image-subscription").text("")
    # マイページ編集をWYSIWYGに
    $(".editable").freshereditor("edit", false)


