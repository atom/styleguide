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
