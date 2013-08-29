$ = require 'jquery'
_ = require 'underscore'
{$$, $$$} = require 'space-pen'
ScrollView = require 'scroll-view'
Editor = require 'editor'
OverlaySelectListView = require './overlay-select-list-view'
coffee = require 'coffee-script'
beautifyHtml = require('js-beautify').html

URI = 'atom://ui-demo'

module.exports =
class UIDemoView extends ScrollView
  registerDeserializer(this)

  @URI: URI

  @content: ->
    @div class: 'ui-demo padded', tabindex: -1, =>

      @section class: 'bordered', 'data-name': 'ui-demo', =>
        @h1 class: 'section-heading', 'UI Demo'
        @p 'This plugin exercises all UI components and acts as a sort of style guide.'

      @section class: 'bordered', 'data-name': 'text', =>
        @h1 class: 'section-heading', 'Text classes'
        @p => @raw 'There are a number of text classes.'

        @h2 'text-* classes'
        @exampleCode '''
          @p class: 'text-smaller', 'Smaller text'
          @div 'Normal text'
          @div class: 'text-subtle', 'Subtle text'
          @div class: 'text-highlight', 'Highlighted text'
          @div class: 'text-info', 'Info text'
          @div class: 'text-success', 'Success text'
          @div class: 'text-warning', 'Warning text'
          @div class: 'text-error', 'Error text'
        '''

        @h2 'highlight-* classes'
        @exampleCode '''
          @span 'Normal text, '
          @span class: 'highlight', 'Highlighted'
          @span ' '
          @span class: 'highlight-info', 'Info'
          @span ' '
          @span class: 'highlight-success', 'Success'
          @span ' '
          @span class: 'highlight-warning', 'Warning'
          @span ' '
          @span class: 'highlight-error', 'Error'
        '''

      @section class: 'bordered', 'data-name': 'layout', =>
        @h1 class: 'section-heading', 'Layout classes'
        @p => @raw 'A few things that might be useful for general layout.'

        @h2 'block'
        @p 'Sometimes you need to separate components vertically. Say in a form.'
        @exampleCode '''
          @div class: 'block', =>
            @label 'You might want to type something here.'
            @div class: 'editor mini editor-colors', 'Something you typed...'
          @div class: 'block', =>
            @label 'Another field'
            @div class: 'editor mini editor-colors', 'Something else you typed...'
          @div class: 'block', =>
            @button class: 'btn', 'Do it'
        '''

        @h2 '.inline-block'
        @p 'Sometimes you need to separate components horizontally.'
        @exampleCode '''
          @div class: 'block', =>
            @label 'This is a thing with stuff in it'
            @div =>
              @div class: 'inline-block editor mini editor-colors', 'Something you typed...'
              @div class: 'inline-block btn-group', =>
                @button class: 'btn', 'One'
                @button class: 'btn', 'Two'

          @div class: 'block', =>
            @button class: 'inline-block btn', 'Do it'
            @button class: 'inline-block btn', 'Another'
            @button class: 'inline-block btn', 'OMG again'
        '''

        @h2 '.inline-block-tight'
        @p 'You might want things to be a little closer to each other.'
        @exampleCode '''
          @div class: 'block', =>
            @button class: 'inline-block-tight btn', 'Do it'
            @button class: 'inline-block-tight btn', 'Another'
            @button class: 'inline-block-tight btn', 'OMG again'
        '''

      @section class: 'bordered', 'data-name': 'git', =>
        @h1 class: 'section-heading', 'Git related classes'
        @p => @raw 'Often we need git related classes to specify status.'

        @h2 'status-* classes'
        @exampleCode '''
          @div class: 'status-ignored', 'Ignored'
          @div class: 'status-added', 'Added'
          @div class: 'status-modified', 'Modified'
          @div class: 'status-removed', 'Removed'
          @div class: 'status-renamed', 'Renamed'
        '''

        @h2 'status-* classes with related icons'
        @exampleCode '''
          @span class: 'status-ignored icon icon-diff-ignored', ''
          @span class: 'status-added icon icon-diff-added', ''
          @span class: 'status-modified icon icon-diff-modified', ''
          @span class: 'status-removed icon icon-diff-removed', ''
          @span class: 'status-renamed icon icon-diff-renamed', ''
        '''

      @section class: 'bordered', 'data-name': 'buttons', =>
        @h1 class: 'section-heading', 'Buttons'
        @p => @raw 'Buttons are similar to bootstrap buttons'

        @h2 'Standalone buttons'
        @exampleCode '''
          @div class: 'block', =>
            @button class: 'btn', 'Button'
          @div class: 'block', =>
            @button class: 'btn btn-xs', 'Extra Small Button'
          @div class: 'block', =>
            @button class: 'btn btn-sm', 'Small Button'
          @div class: 'block', =>
            @button class: 'btn btn-lg', 'Large Button'
        '''

        @h2 'Button Groups'
        @exampleCode '''
          @div class: 'block', =>
            @div 'Normal size'
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div 'Extra Small'
            @div class: 'btn-group btn-group-xs', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div 'Small'
            @div class: 'btn-group btn-group-sm', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div 'Large'
            @div class: 'btn-group btn-group-lg', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
        '''

        @h2 'Selected buttons'
        @p => @raw 'Buttons can be marked selected by adding a <code>.selected</code> class. Useful for toggle groups.'
        @exampleCode '''
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn selected', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn selected', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn selected', 'Three'
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn selected', 'One'
              @button class: 'btn selected', 'Two'
              @button class: 'btn', 'Three'
        '''

      ###
      @section class: 'bordered', 'data-name': 'tool-panel', =>
        @h1 class: 'section-heading', 'Tool Panel'
        @p 'A container attached to some side of the Atom UI. This UI Demo is in a tool panel.'
        @exampleCode '''
          @div class: 'tool-panel panel-bottom padded', =>
            @div 'Some content'
        '''
        @p => @raw 'Supports <code>.panel-bottom</code> and <code>.panel-left</code> classes.'

      @section class: 'bordered', 'data-name': 'inset-panel', =>
        @h1 class: 'section-heading', 'Inset Panel'
        @p => @raw 'Use inside another panel, like a <code>.tool-panel</code>.'
        @h2 'Without a heading'
        @exampleCode '''
          @div class: "tool-panel panel-bottom padded", =>
            @div class: "inset-panel padded", 'Some content'
        '''

        @h2 'With a heading'
        @exampleCode '''
          @div class: "tool-panel panel-bottom padded", =>
            @div class: "inset-panel", =>
              @div class: "panel-heading", 'An inset-panel heading'
              @div class: "panel-body padded", 'Some Content'
        '''

      @section class: 'bordered', 'data-name': 'list-group', =>
        @h1 class: 'section-heading', 'List Group'
        @p 'Use for anything that requires a list.'
        @exampleCode '''
          @ul class: 'list-group', =>
            @li class: 'list-item', 'Normal item'
            @li class: 'list-item selected', =>
              @span 'This is the Selected item.'
            @li class: 'list-item text-subtle', 'Subtle'
            @li class: 'list-item text-info', 'Info'
            @li class: 'list-item text-success', 'Success'
            @li class: 'list-item text-warning', 'Warning'
            @li class: 'list-item text-error', 'Error'
        '''

        @h2 'With icons'
        @exampleCode '''
          @ul class: 'list-group', =>
            @li class: 'list-item', =>
              @span class: 'icon icon-file-directory', 'Using a span with an icon'
            @li class: 'list-item', =>
              @i class: 'icon icon-file-directory', ''
              @span 'With .icon-file-directory using <i> tags'
            @li class: 'list-item selected', =>
              @span class: 'icon icon-file-directory', 'Selected with .icon-file-directory'
            @li class: 'list-item', =>
              @span class: 'no-icon', 'With .no-icon'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-text', 'With icon-file-text'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-media', 'With icon-file-media'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-symlink-file', 'With icon-file-symlink-file'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-submodule', 'With icon-file-submodule'
            @li class: 'list-item', =>
              @span class: 'icon icon-book', 'With icon-book'
        '''

        @h2 'In an .inset-panel'
        @exampleCode '''
          @div class: 'tool-panel panel-bottom padded', =>
            @div class: 'inset-panel', =>
              @div class: 'panel-heading', 'My list-group with icons'
              @div class: 'panel-body padded', =>
                @ul class: 'list-group', =>
                  @li class: 'list-item', =>
                    @span class: 'icon icon-file-text', 'With icon-file-text'
                  @li class: 'list-item', =>
                    @span class: 'icon icon-file-media', 'With icon-file-media'
                  @li class: 'list-item', =>
                    @span class: 'icon icon-book', 'With icon-book'
        '''

      @section class: 'bordered', 'data-name': 'list-tree', =>
        @h1 class: 'section-heading', 'List Tree'
        @p => @raw 'A <code>.list-tree</code> is a special case of <code>.list-group</code>.'
        @p => @raw '<code>.list-tree.has-collapsable-children</code> gives the children with nested items disclosure arrows.'
        @exampleCode '''
          @ul class: 'list-tree has-collapsable-children', =>
            @li class: 'list-nested-item', =>
              @div class: 'list-item', =>
                @span class: 'icon icon-file-directory', 'A Directory'
              @ul class: 'list-tree', =>
                @li class: 'list-nested-item', =>
                  @div class: 'list-item', =>
                    @span class: 'icon icon-file-directory', 'Nested Directory'
                  @ul class: 'list-tree', =>
                    @li class: 'list-item', =>
                      @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-nested-item collapsed', =>
                  @div class: 'list-item', =>
                    @span class: 'icon icon-file-directory', 'Collpased Nested Directory'
                  @ul class: 'list-tree', =>
                    @li class: 'list-item', =>
                      @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-item', =>
                  @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-item selected', =>
                  @span class: 'icon icon-file-text', 'File three .selected!'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-text', '.icon-file-text'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-symlink-file', '.icon-file-symlink-file'
        '''

      @section class: 'bordered', 'data-name': 'overlay', =>
        @h1 class: 'section-heading', 'Overlays'
        @p => @raw 'Overlays are like dialog boxes.'
        @p => @raw '''
          Supported classes: <code>.from-top</code>, <code>.from-bottom</code> and <code>.floating</code>.
          <code>.from-top</code> will come down from the top of the UI, etc.
        '''
        @exampleCode '''
          @div class: 'overlay from-top', =>
            @div 'Some content'
        '''

      @section class: 'bordered', 'data-name': 'select-list', =>
        @h1 class: 'section-heading', 'Select List'
        @p => @raw '''
          You wont be creating a <code>.select-list</code> directly, but will do so
          by extending the <code>SelectList</code> class. Your
          <code>SelectList</code> will usually specify only the list items,
          and hide/show the errors or loading message.
        '''

        @p => @raw 'This is how you will typically specify a <code>.select-list</code>.'
        @exampleOverlaySelectList ['one', 'two', 'three']

        @p => @raw 'The list items have many options you can use, and shows you how they will display.'

        @h2 'Basic example with one item selected'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'selected', 'one'
              @li 'two'
              @li 'three'
        '''

        @h2 'Single line with icons'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'selected', =>
                @div class: 'status status-added icon icon-diff-added', ''
                @div class: 'icon icon-file-text', 'Some file'
              @li =>
                @div class: 'status status-modified icon icon-diff-modified', ''
                @div class: 'icon icon-file-text', 'Another file'
              @li =>
                @div class: 'status status-removed icon icon-diff-removed', ''
                @div class: 'icon icon-file-text', 'Yet another file'
        '''

        @h2 'Multiple lines with no icons'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'two-lines', =>
                @div class: 'primary-line', 'Primary line'
                @div class: 'secondary-line', 'Secondary line'
              @li class: 'two-lines selected', =>
                @div class: 'primary-line', 'A thing'
                @div class: 'secondary-line', 'Description of the thing'
        '''

        @h2 'Multiple lines with icons'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'two-lines', =>
                @div class: 'status status-added icon icon-diff-added', ''
                @div class: 'primary-line icon icon-file-text', 'Primary line'
                @div class: 'secondary-line no-icon', 'Secondary line'
              @li class: 'two-lines selected', =>
                @div class: 'status status-modified icon icon-diff-modified', ''
                @div class: 'primary-line icon icon-file-symlink-file', 'A thing'
                @div class: 'secondary-line no-icon', 'Description of the thing'
              @li class: 'two-lines', =>
                @div class: 'status status-renamed icon icon-diff-renamed', ''
                @div class: 'primary-line icon icon-file-symlink-file', 'A thing'
                @div class: 'secondary-line no-icon', 'Description of the thing'
        '''

        @h2 'Using mark-active class to indicate the active item'
        @p => @raw 'Use ...'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group mark-active', =>
              @li 'Normal item'
              @li class: 'selected', 'Selected &mdash; user is arrowing through the list.'
              @li class: 'active', 'This is the active item'
              @li class: 'selected active', 'Selected AND Active!'
        '''

        @h2 'Error messages'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @div class: 'editor editor-colors mini', 'I searched for this'
            @div class: 'error-message', 'Nothing has been found!'
        '''

        @h2 'Loading message'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @div class: 'editor editor-colors mini', 'User input'
            @div class: 'loading', =>
              @span class: 'loading-message', 'Chill, bro. Things are loading.'
              @span class: 'badge', '1234'
        '''

      @section class: 'bordered', 'data-name': 'popover-list', =>
        @h1 class: 'section-heading', 'Popover List'
        @p => @raw '''
          A <code>.popover-list</code> is a <code>.select-list</code> that
          is meant to popover the code for something like autocomplete.
        '''

        @h2 'Basic example with one item selected'
        @exampleCode '''
          @div class: 'select-list popover-list', =>
            @div class: 'editor mini editor-colors', 'User types here..'
            @ol class: 'list-group', =>
              @li class: 'selected', 'one'
              @li 'two'
              @li 'three'
        '''

      @section class: 'bordered', 'data-name': 'error-messages', =>
        @h1 class: 'section-heading', 'Error messages'
        @ul class: 'error-messages', outlet: 'errorMessages'

      @section class: 'bordered', 'data-name': 'loading-spinners', =>
        @h1 class: 'section-heading', 'Loading spinners'
        @div class: 'loading is-loading pull-center loading-spinner-small', outlet: 'loadingMessage'

  @exampleCode: (spacePenCoffee) =>

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

  @colorizedCodeBlock: (cssClass, grammarScopeName, code) ->
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
  @exampleOverlaySelectList: (array) ->
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


  @deserialize: (options={}) ->
    new UIDemoView(options)

  initialize: ({collapsedSections}={}) ->
    @on 'click', '.section-heading', ->
      $(this).parent().toggleClass('collapsed')

    @on 'click', '.example-code .btn-group .btn', ->
      btn = $(this)
      example = btn.parents('.example-code')
      clas = btn.attr('data-display-class')

      example.find('.btn').removeClass('selected')
      example.removeClass('show-example-html show-example-space-pen')
      example.addClass(clas)

      btn.addClass('selected')

    @setCollapsedSections(collapsedSections)

  serialize: ->
    deserializer: 'UIDemoView'
    collapsedSections: @getCollapsedSections()

  getUri: -> URI

  getTitle: -> "UI Demo"

  getCollapsedSections: ->
    $(sec).attr('data-name') for sec in @find('section.collapsed')

  setCollapsedSections: (collapsedSections=[]) ->
    for section in collapsedSections
      @find("[data-name=\"#{section}\"]").addClass('collapsed')
    null

  isEqual: (other) ->
    other instanceof UIDemoView


