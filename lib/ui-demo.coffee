UIDemoView = null

uiDemoUri = 'atom://ui-demo'

createUIDemoView = (state) ->
  UIDemoView ?= require './ui-demo-view'
  new UIDemoView(state)

deserializer =
  name: 'UIDemoView'
  deserialize: (state) -> createUIDemoView(state)
registerDeserializer(deserializer)

module.exports =
  activate: ->
    project.registerOpener (filePath) ->
      createUIDemoView(uri: uiDemoUri) if filePath is uiDemoUri

    rootView.command 'ui-demo:show', -> rootView.open(uiDemoUri)
