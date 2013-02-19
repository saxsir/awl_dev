# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#grid").gridalicious({
    gutter:10,
    animate:true
  })

jQuery ->
  $('.carousel').carousel('cycle')

#Procedureのシングルページでの遷移の実装
#だんだん良くないことをしているような気がしてきた
jQuery ->

	#どんな選択と入力をしたか
	amount = 0
	reward_id = null

	#とりあえず隠す（display:noneだけど)
	$('#procedure_page_2').hide()

	#numericなinputに対しての制限をかける
	$(".positive-integer").numeric
  decimal: false
  negative: false
, ->
  alert "Positive integers only"
  @value = ""
  @focus()

	$('#nextButton').click ->
		valS = $('.input-amount input').val()
		amount = Number(valS) || 0

		if amount <= 0

			#flash
			$(".alert").show("highlight",300)
		else
			$('#procedure_page_1').hide('blind',300)
			$('#procedure_page_2').show("clip",500)
	$('#prevButton').click ->
		$('#procedure_page_2').hide('clip',300)
		$('#procedure_page_1').show("blind",500)
