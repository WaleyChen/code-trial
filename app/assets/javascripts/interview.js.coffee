# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$(document).ready ->
  cm = CodeMirror.fromTextArea(
    $('#codearea').get(0),
    {
      theme: "monokai"
      mode: "ruby"
      onChange: (c,i) ->
        $('#codearea').text(cm.getValue())
    })

  counter = 0
  log = []
  polling_interval = 3
  first_time = 0
  times = []

  $('.code_form input[type="submit"]').click( (e) ->
    console.log(log)
    console.log(JSON.stringify(log))
    e.preventDefault()
    $.ajax(
      url: '#{record_path}'
      type: 'POST'
      beforeSend: (xhr) -> xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      data: JSON.stringify(log)
      success: (response) ->
        $('#someDiv').html(response)
    )
  )

  # Saving the polled text
  polling_text = ->
    # text = $('.poll-target').val()
    text = cm.getValue();
    # console.log(text);
    # console.log(log.length-1)
    last = log[log.length-1]

    if (text != last)
      console.log(text)
      log.push(text)
      times.push(counter)
    counter++

  start_recording = ->
    timer = setInterval(polling_text, polling_interval)
    console.log('Starting to record!')

  if (first_time == 0)
    start_recording()
  first_time = 1
  
  # Replay the logged
  $('.poll-replay').click( () ->
    times.reverse()
    log.reverse()
    clearInterval(timer)
    $('.poll-target2').val('')

    replay_text
    counter2 = 0

    replay = ->
      $('.poll-target2').val(replay_text)
      if (times.length > 0 && counter2 == times[times.length-1])
        # times[times.length-1]
        times.pop()
        replay_text = log.pop()
      counter2++
    setInterval(replay, polling_interval)
  )
