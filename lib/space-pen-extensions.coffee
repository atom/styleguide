$ = require 'jquery'
_ = require 'underscore'
{View, $$, $$$} = require 'space-pen'

coffee = require 'coffee-script'
beautifyHtml = require('js-beautify').html

Editor = require 'editor'

OverlaySelectListView = require './overlay-select-list-view'

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
    # FIXME: this is editor abuse. I just want the tokenized html.
    editor = new Editor(mini: true)
    editor.setText(code)

    editorBlock = $$ ->
      @div class: cssClass+' editor mini', ''

    refreshHtml = (timeout) ->
      fn = ->
        html = editor.htmlForScreenRows(0, editor.getLineCount()-1)
        editorBlock.html(html)
      # FIXME: does not colorize without the timeout...
      if timeout then setTimeout(fn, 10) else fn()
    refreshHtml() # initially set the null-grammar'd code

    if grammar = syntax.grammarForScopeName(grammarScopeName)
      editor.setGrammar(grammar)
      refreshHtml(true)
    else
      syntax.on 'grammar-added grammar-updated', (grammar) ->
        return unless grammar.scopeName == grammarScopeName
        editor.setGrammar(grammar)
        refreshHtml(true)

    @subview '__', editorBlock

    # TODO: maybe take this out. It might not add that much to the docs?
  exampleOverlaySelectList: (array) ->
    selectList = new OverlaySelectListView array, (item) ->
      $$ ->
        @li =>
          @raw item

    html = $('<div/>').append(selectList).html()

    coffeeScript = """
      class OverlaySelectListView extends SelectList
        @viewClass: ->
          "\#{super} overlay from-top"

        initialize: (@listOfItems) ->
          super
          @setArray(@listOfItems)

        attach: ->
          super
          @appendTo(rootView)
          @miniEditor.focus()

        # Here you specify the list items
        itemForElement: (item) ->
          $$ ->
            @li =>
              @raw item

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
