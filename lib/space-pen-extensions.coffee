{_, $, $$, $$$, Editor, View} = require 'atom'

coffee = require 'coffee-script'
beautifyHtml = require('js-beautify').html

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
    editorBlock = $$ ->
      @pre class: cssClass+' editor-colors editor', ''

    refreshHtml = (grammar) ->
      editorBlock.empty()
      for tokens in grammar.tokenizeLines(code)
        editorBlock.append(Editor.buildLineHtml({tokens, text: code}))

    if grammar = atom.syntax.grammarForScopeName(grammarScopeName)
      refreshHtml(grammar)
    else
      syntax.on 'grammar-added grammar-updated', (grammar) ->
        return unless grammar.scopeName == grammarScopeName
        refreshHtml(grammar)

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
          @appendTo(atom.rootView)
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
