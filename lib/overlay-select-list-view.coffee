{_, $, $$, SelectListView} = require 'atom'

module.exports =
class OverlaySelectListView extends SelectListView

  @viewClass: ->
    "#{super} overlay from-top"

  initialize: (@listOfItems, @itemGenerator) ->
    super
    @setArray(@listOfItems)

  attach: ->
    super
    @appendTo(atom.workspaceView)
    @miniEditor.focus()

  itemForElement: (item) ->
    @itemGenerator(item)

  cancel: ->
    # Do nothing. We never want this to hide
