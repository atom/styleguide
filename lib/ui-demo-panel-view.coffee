{View} = require 'space-pen'

module.exports =
class UIDemoPanelView extends View

  @content: ->
    @div class: 'ui-demo tool-panel panel-bottom', =>

      @div class: 'inset-panel', =>
        @div class: 'panel-heading', =>
          @button class: 'btn btn-mini pull-right', 'Header Button'
          @span '.panel-heading'
        @div class: 'panel-body', =>
          @p '.inset-panel'

      @ul class: 'error-messages', outlet: 'errorMessages'

      @div class: 'loading is-loading pull-center loading-spinner-small', outlet: 'loadingMessage'

  initialize: ->
    @attach()

  attach: =>
    rootView.vertical.append(this)

