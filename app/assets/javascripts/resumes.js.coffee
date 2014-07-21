# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("#resume_dob").mask "99/99/9999"
  $("#resume_cpf").mask "999.999.999-99"
  $("#resume_postal_code").mask "99.999-999"
  $("#resume_tel_residence").mask "(99) 9999-9999"
  $("#resume_tel_celular").mask "(99) 99999-9999"
  $("#resume_tel_comercial").mask "(99) 9999-9999"
