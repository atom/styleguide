StyleguideView = null
styleguideUri = 'atom://styleguide'

createStyleguideView = (state) ->
  StyleguideView ?= require './styleguide-view'
  new StyleguideView(state)

atom.deserializers.add
  name: 'StyleguideView'
  deserialize: (state) -> createStyleguideView(state)

module.exports =
  activate: ->
    atom.workspace.addOpener (filePath) ->
      createStyleguideView(uri: styleguideUri) if filePath is styleguideUri

    @disposable = atom.commands.add 'atom-workspace', 'styleguide:show', ->
      atom.workspace.open(styleguideUri)

  deactivate: ->
    @disposable.dispose()
