StyleguideView = null
styleguideUri = 'atom://styleguide'

createStyleguideView = (state) ->
  StyleguideView ?= require './styleguide-view'
  new StyleguideView(state)

deserializer =
  name: 'StyleguideView'
  deserialize: (state) -> createStyleguideView(state)
atom.deserializers.add(deserializer)

module.exports =
  activate: ->
    atom.project.registerOpener (filePath) ->
      createStyleguideView(uri: styleguideUri) if filePath is styleguideUri

    atom.workspaceView.command 'styleguide:show', -> atom.workspaceView.open(styleguideUri)
