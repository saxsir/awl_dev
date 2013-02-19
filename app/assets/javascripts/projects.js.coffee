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
jQuery ->
	$('#procedure_page_2').hide()
	$('#nextButton').click ->
		$('#procedure_page_1').hide('blind',300)
		$('#procedure_page_2').show("clip",500)
