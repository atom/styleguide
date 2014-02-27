{SelectListView} = require 'atom'

module.exports =
class OverlaySelectListView extends SelectListView
  initialize: (@listOfItems, @itemGenerator) ->
    super
    @addClass('overlay from-top')
    @setItems(@listOfItems)

  attach: ->
    atom.workspaceView.append(this)
    @focusFilterEditor()

  viewForItem: (item) ->
    @itemGenerator(item)

  cancel: ->
    # Do nothing. We never want this to hide

  confirmed: (item) ->
    # Do nothing. We never want this to hide
