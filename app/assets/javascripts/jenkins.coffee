# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.getBuilds = ()->
	job = $('#current_job').text()
	$.ajax
		url: 'jenkins/builds'
		type: 'GET'
		dataType: 'html'
		data: job: job
		error: (jqXHR,textStatus,errorThrown)->
			message = jqXHR.responseText.match(/^[^\n]*\n[^\n]*\n[^\n]*/)[0]
			console.log message
			$('#builds').html("<p><b>Can't get builds from jenkins because of error</b>:<br/>#{message.match(/[^\n]*$/)[0]}</p>")
		success: (response) ->
			$('#builds').html(response)

window.getCurrentBuilds = ()->
	$.ajax
		url: 'jenkins/current_builds'
		type: 'GET'
		dataType: 'html'
		error: (jqXHR,textStatus,errorThrown)->
			message = jqXHR.responseText.match(/^[^\n]*\n[^\n]*\n[^\n]*/)[0]
			console.log message
			$('#current_builds').html("<p><b>Can't get current builds from jenkins because of error</b>:<br/>#{message.match(/[^\n]*$/)[0]}</p>")
		success: (response) ->
			$('#current_builds').html(response)

$(document).on "page:change", ()->
	getCurrentBuilds()
setInterval(getCurrentBuilds, 10000);