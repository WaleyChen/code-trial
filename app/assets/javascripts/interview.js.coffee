# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$(document).ready ->

  rec = $("#recording")[0]
  $("#slider").slider(
    max: 1000
    change: (event, ui) ->
      unless playing()
        rec.currentTime = rec.duration * ui.value / 1000
  )

  btn = $("#play-stop-btn")
  toggleBtn = (event) ->
    event.preventDefault()
    if btn.text() == "PLAY"
      btn.text("STOP")
      btn.removeClass("btn-success")
      btn.addClass("btn-danger")
      rec.play()
      sync = setInterval(syncSildebar, 30)
    else
      btn.text("PLAY")
      btn.removeClass("btn-danger")
      btn.addClass("btn-success")
      rec.pause()
      clearInterval(sync)

  playing = ->
    btn.text() == "STOP"

  syncSildebar = ->
    $("#slider").slider("option","value", rec.currentTime/rec.duration * 1000)

  $("#play-stop-btn").click(toggleBtn)
