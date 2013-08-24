UIDemoPanelView = require './ui-demo-panel-view'

module.exports =
  activate: (state) ->
    @panelView = new UIDemoPanelView

  deactivate: ->
    @panelView.destroy()
