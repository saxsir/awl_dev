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
	$('#procedure_page_2').hide()
	$('#nextButton').click ->
		valS = $('#input-number-amount').val
		val = Number(valS) || 0
		alert(val)
		$('#procedure_page_1').hide('blind',300)
		$('#procedure_page_2').show("clip",500)
	$('#prevButton').click ->
		$('#procedure_page_2').hide('clip',300)
		$('#procedure_page_1').show("blind",500)
