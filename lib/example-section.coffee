{$$} = require 'atom-space-pen-views'

module.exports =
class ExampleSection
  loaded: false

  @build: (view, name, title, buildFn) ->
    sectionEl = $$ ->
      @section class: 'bordered collapsed', 'data-name': name, =>
        @h1 class: 'section-heading', title
    new ExampleSection(name, sectionEl, buildFn)

  constructor: (@name, @el, @buildFn) ->

  load: ->
    return if @loaded
    self = this
    @el.append($$ -> self.buildFn.call(this))
    @loaded = true

  toggle: ->
    if @el.hasClass('collapsed')
      @expand()
    else
      @collapse()

  collapse: ->
    @el.addClass('collapsed')

  expand: ->
    @load()
    @el.removeClass('collapsed')
