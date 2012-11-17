###*
# Main script
# @project backbone-skeleton
# @title main
###


helper = require 'helper'
template = require 'template'

jQuery ($) ->

  values =
    description: 'My starting point of working with bare Brunch.'

  $('#main')
  .append($(template()))
  .masonry
    itemSelector: '.item'
    columnWidth: 10
    isAnimated: true

  $p = $('<p/>')
  $p.append 'Hello, I am the main script!'

  main = ->
    $('#special').append $p

  setTimeout ->
    main()
    setTimeout ->
      helper()
    , 2000
  , 2000


