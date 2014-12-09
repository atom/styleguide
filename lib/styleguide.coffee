{CompositeDisposable} = require 'atom'
StyleguideUri = 'atom://styleguide'

createStyleguideView = (state) ->
  StyleguideView = require './styleguide-view'
  new StyleguideView(state)

atom.deserializers.add
  name: 'StyleguideView'
  deserialize: (state) -> createStyleguideView(state)

module.exports =
  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.workspace.addOpener (filePath) ->
      createStyleguideView(uri: StyleguideUri) if filePath is StyleguideUri
    @subscriptions.add atom.commands.add 'atom-workspace', 'styleguide:show', ->
      atom.workspace.open(StyleguideUri)

  deactivate: ->
    @subscriptions.dispose()
