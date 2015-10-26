# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".deleteRecord").click ->
    current_record_tr = $(this).parents('tr')[0]
    $.ajax
      url: 'dashboard/' + $(current_record_tr).attr('recordid')
      type: 'DELETE'
      $(current_record_tr).fadeOut(700)

$ ->
  $("#refresh").click ->
    $.ajax
      url: 'dashboard/index'
      type: 'GET'