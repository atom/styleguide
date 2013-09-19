UIDemoView = require './ui-demo-view'

module.exports =
  activate: (state) ->
    project.registerOpener (filePath) ->
      new UIDemoView() if filePath is UIDemoView.URI

    rootView.command 'ui-demo:show', ->
      rootView.open(UIDemoView.URI)
