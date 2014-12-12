_ = require 'underscore-plus'
{$, $$, $$$, View} = require 'atom-space-pen-views'
coffee = require 'coffee-script'
beautifyHtml = require('js-beautify').html
Highlights = require 'highlights'
ExampleSelectListView = require './example-select-list-view'

highlighter = null

_.extend View,
  exampleHtml: (html) ->
    @div class: 'example', =>
      @div class: 'example-rendered', =>
        @raw html

      @div class: 'example-code show-example-html', =>
        @colorizedCodeBlock 'example-html', 'text.xml', beautifyHtml(html)

  exampleOverlaySelectList: ->
    selectList = new ExampleSelectListView(['one', 'two', 'three'])
    coffeeScript = """
      {SelectListView, $$} = require 'atom-space-pen-views'

      module.exports =
      class ExampleSelectListView extends SelectListView
        initialize: (@listOfItems) ->
          super
          @setItems(@listOfItems)

        viewForItem: (item) ->
          $$ -> @li(item)

        cancel: ->
          console.log("cancelled")

        confirmed: (item) ->
          console.log("confirmed", item)
    """

    @div class: 'example', =>
      @div class: 'example-rendered', =>
        @tag 'atom-panel', class: 'modal', =>
          @subview '__', selectList
      @div class: 'example-code show-example-space-pen', =>
        @colorizedCodeBlock 'example-space-pen', 'source.coffee', coffeeScript

  colorizedCodeBlock: (cssClass, grammarScopeName, code) ->
    highlighter ?= new Highlights(registry: atom.grammars)
    highlightedHtml = highlighter.highlightSync
      fileContents: code
      scopeName: grammarScopeName

    highlightedBlock = $(highlightedHtml)
    # The `editor` class messes things up as `.editor` has absolutely positioned lines
    highlightedBlock.removeClass('editor')
    highlightedBlock.addClass(cssClass)
    if fontFamily = atom.config.get('editor.fontFamily')
      highlightedBlock.css('font-family', fontFamily)

    @subview '__', highlightedBlock
