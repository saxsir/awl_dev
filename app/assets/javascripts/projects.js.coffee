# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#project系全体のテーマ
jQuery ->
  $("#grid").gridalicious({
    gutter:10,
    animate:true
  })
  $('.carousel').carousel('cycle')


# ShowのTooltip
jQuery ->
	$('.comment').tooltip()

#Procedureのシングルページでの遷移の実装
#だんだん良くないことをしているような気がしてきた
jQuery ->

	 #numericなinputに対しての制限をかける
	$(".positive-integer").numeric
  decimal: false
  negative: false
, ->
  alert "Positive integers only"
  @value = ""
  @focus()

	#どんな選択と入力をしたか
	amount = 0
	reward_id = null

	#ページ２への遷移
	$('#nextButton').click ->

		#とりあえず金額を取得
		valS = $('.input-amount input').val()
		amount = Number(valS) || 0

		#次にラジオボタン(リワード）を取得
		reward_idS = $("input:radio[name='rewardSelect']:checked").val()
		reward_id = Number(reward_idS) || null

		if amount <= 0 || reward_idS == undefined

			#ゼロ円以下あるいはリワードが選択されていないときalertを出す
			$(".alert").show("highlight",300)
		else

			#jsでのバリデーションが通ったら、ページ遷移
			$('#procedure_page_1').hide('blind',500)
			$('#procedure_page_2').show("clip",500)

			#選択内容を確認させる
			$('#supportAmount').text("¥"+amount)
			$('#supportRewards').text(reward_id)#ここ、idを取ってるから、id一致のinputタグからdescriptionを抜いてくるとか、そういう風にすべき

			#hidden_formに突っ込む
			$('#support_amount').val(amount)
			$('#support_reward_id').val(reward_id)

	#ページ２で戻るボタンを押したとき
	$('#prevButton').click ->
		$('#procedure_page_2').hide('clip',500)
		$('#procedure_page_1').show("blind",500)

