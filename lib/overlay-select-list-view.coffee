{$$} = require 'space-pen'
SelectList = require 'select-list'
$ = require 'jquery'
_ = require 'underscore'

module.exports =
class OverlaySelectListView extends SelectList

  @viewClass: ->
    "#{super} overlay from-top"

  initialize: (@listOfItems, @itemGenerator) ->
    super
    @setArray(@listOfItems)

  attach: ->
    super
    @appendTo(rootView)
    @miniEditor.focus()

  itemForElement: (item) ->
    @itemGenerator(item)

  confirmed: ({eventName}) ->
    @cancel()
