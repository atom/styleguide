UIDemoView = null

uiDemoUri = 'atom://styleguide'

createUIDemoView = (state) ->
  UIDemoView ?= require './styleguide-view'
  new UIDemoView(state)

deserializer =
  name: 'UIDemoView'
  deserialize: (state) -> createUIDemoView(state)
registerDeserializer(deserializer)

module.exports =
  activate: ->
    project.registerOpener (filePath) ->
      createUIDemoView(uri: uiDemoUri) if filePath is uiDemoUri

    rootView.command 'styleguide:show', -> rootView.open(uiDemoUri)
