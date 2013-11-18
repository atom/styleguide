StyleguideView = null
styleguideUri = 'atom://styleguide'

createStyleguideView = (state) ->
  StyleguideView ?= require './styleguide-view'
  new StyleguideView(state)

deserializer =
  name: 'StyleguideView'
  deserialize: (state) -> createStyleguideView(state)
registerDeserializer(deserializer)

module.exports =
  activate: ->
    project.registerOpener (filePath) ->
      createStyleguideView(uri: styleguideUri) if filePath is styleguideUri

    rootView.command 'styleguide:show', -> rootView.open(styleguideUri)
