_ = require 'underscore-plus'
{$, $$, $$$, EditorView, View} = require 'atom'

coffee = require 'coffee-script'
beautifyHtml = require('js-beautify').html
Highlights = require 'highlights'

OverlaySelectListView = require './overlay-select-list-view'

highlighter = null

_.extend View,
  exampleCode: (spacePenCoffee) ->
    # I need to pass the proper context to the spacepen functions, so I return
    # a fn, which I will apply after eval'ing. Magic!
    wrappedCode = """
      evaluator = ->
      #{('  '+line for line in spacePenCoffee.split('\n')).join('\n')}
      evaluator
    """

    # FIXME: Is this the best way to grab the html from spacepen?
    html = $$$ ->
      coffee.eval(wrappedCode).apply(this)

    @div class: 'example', =>
      @div class: 'example-rendered', =>
        @raw html

      @div class: 'example-code show-example-space-pen', =>
        @div class: 'btn-group btn-group-xs btn-toggle', =>
          @button class: 'btn selected', 'data-display-class': 'show-example-space-pen', 'space-pen'
          @button class: 'btn', 'data-display-class': 'show-example-html', 'html'
        @colorizedCodeBlock 'example-space-pen', 'source.coffee', spacePenCoffee
        @colorizedCodeBlock 'example-html', 'text.xml', beautifyHtml(html)

  colorizedCodeBlock: (cssClass, grammarScopeName, code) ->

    highlighter ?= new Highlights(registry: atom.syntax)
    highlightedHtml = highlighter.highlightSync
      fileContents: code
      scopeName: grammarScopeName

    highlightedBlock = $(highlightedHtml)
    # The `editor` class messes things up as `.editor` has absolutely positioned lines
    highlightedBlock.removeClass('editor')
    highlightedBlock.addClass(cssClass)

    @subview '__', highlightedBlock

  # TODO: maybe take this out. It might not add that much to the docs?
  exampleOverlaySelectList: (array) ->
    selectList = new OverlaySelectListView array, (item) ->
      $$ ->
        @li =>
          @raw item

    html = $('<div/>').append(selectList).html()

    coffeeScript = """
      class OverlaySelectListView extends SelectListView
        initialize: (@listOfItems) ->
          super
          @addClass('overlay from-top')
          @setItems(@listOfItems)

        attach: ->
          atom.workspaceView.append(this)
          @focusFilterEditor()

        # Here you specify the view for an item
        viewForItem: (item) ->
          $$ ->
            @li =>
              @raw item

        confirmed: (item) ->
          console.log(item)

      view = new OverlaySelectListView([#{array}])
      view.attach()
    """

    @div class: 'example', =>
      @div class: 'example-rendered', =>
        @subview '__', selectList
      @div class: 'example-code show-example-space-pen', =>
        @div class: 'btn-group btn-group-xs btn-toggle', =>
          @button class: 'btn selected', 'data-display-class': 'show-example-space-pen', 'space-pen'
          @button class: 'btn', 'data-display-class': 'show-example-html', 'html'
        @colorizedCodeBlock 'example-space-pen', 'source.coffee', coffeeScript
        @colorizedCodeBlock 'example-html', 'text.xml', beautifyHtml(html)
