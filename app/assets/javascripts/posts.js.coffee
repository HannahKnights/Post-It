# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  
  $('.about').on 'click', (e) ->

    e.preventDefault()
    $('.about-page').show()

    $('.about-close').on 'click', (e) ->

      e.preventDefault()
      $('.about-page').hide()

  $('.post').on 'click', (e) ->

    e.preventDefault()
    $('.new-post').show()

    $('.new-post-close').on 'click', (e) ->

      e.preventDefault()
      $('.new-post').hide()

  $('.comment-link').on 'click', (e) ->

    e.preventDefault()
    $('.add-comment').show()

    $('.add-comment-close').on 'click', (e) ->

      e.preventDefault()
      $('.add-comment').hide()

  

