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
  $("#save-button").click	->
    $("#fileLoader").hide("blind",10)
    $("#save-button").hide("blind",10)
    $("#edit-button").show("blind",10)
    $("#edit-subscription").text("「編集する」ボタンを押すと、ユーザー情報をクリックして編集可能になります！")
    $("#profile-image-subscription").text("")
    # マイページ編集をWYSIWYGに
    $(".editable").freshereditor("edit", false)
