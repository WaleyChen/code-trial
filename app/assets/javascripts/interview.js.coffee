# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$(document).ready ->
  if $('#codearea').length > 0
    CodeMirror.fromTextArea(
      $('#codearea').get(0),
      {
        theme: "monokai"
        mode: "ruby"
      }
    )

  rec = $("#recording")[0]
  $("#slider").slider(
    change: (event, ui) ->
      rec.currentTime = rec.duration * ui.value / 100
  )

  toggleBtn = (event) ->
    event.preventDefault()
    btn = $(this)
    if btn.text() == "PLAY"
      btn.text("STOP")
      btn.removeClass("btn-success")
      btn.addClass("btn-danger")
      rec.play()
    else
      btn.text("PLAY")
      btn.removeClass("btn-danger")
      btn.addClass("btn-success")
      rec.pause()

  $("#play-stop-btn").click(toggleBtn)


