{View} = require 'space-pen'

module.exports =
class UIDemoPanelView extends View

  @content: ->
    @div class: 'ui-demo tool-panel panel-bottom padded', =>

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'UI Demo'
        @p 'This plugin exercises all the UI components.'
        @p =>
          @span 'All components here are in a '
          @code '.tool-panel.panel-bottom'

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'List Group'
        @h3 'ul.list-group'
        @ul class: 'list-group', =>
          @li 'Normal item'
          @li class: 'selected', =>
            @div class: 'highlight'
            @span '.selected'
          @li class: 'subtle', '.subtle'
          @li class: 'info', '.info'
          @li class: 'success', '.success'
          @li class: 'warning', '.warning'
          @li class: 'error', '.error'

        @h3 'With icons'
        @ul class: 'list-group', =>
          @li =>
            @span class: 'icon icon-file-directory', 'With .icon-file-directory'
          @li =>
            @i class: 'icon icon-file-directory'
            @span 'With .icon-file-directory using <i> tags'
          @li =>
            @span class: 'no-icon', 'With .no-icon'
          @li class: 'selected', =>
            @span class: 'highlight'
            @i class: 'icon icon-file-directory'
            @span '.selected With .icon-file-directory'
          @li => @span class: 'icon icon-file-text', '.icon-file-text'
          @li => @span class: 'icon icon-file-symlink-file', '.icon-file-symlink-file'
          @li => @span class: 'icon icon-file-submodule', '.icon-file-submodule'
          @li => @span class: 'icon icon-file-media', '.icon-file-media'
          @li => @span class: 'icon icon-book', '.icon-book'

        @h3 'In an .inset-panel'
        @div class: 'inset-panel', =>
          @div class: 'panel-heading', '.list-group'
          @div class: 'panel-body padded', =>
            @ul class: 'list-group', =>
              @li class: 'selected', =>
                @span class: 'highlight'
                @i class: 'icon icon-file-directory'
                @span '.selected With .icon-file-directory'
              @li => @span class: 'icon icon-file-text', '.icon-file-text'
              @li => @span class: 'icon icon-file-symlink-file', '.icon-file-symlink-file'
              @li => @span class: 'icon icon-file-submodule', '.icon-file-submodule'
              @li => @span class: 'icon icon-file-media', '.icon-file-media'

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'List Tree'
        @h3 'ul.list-tree'
        @ul class: 'list-tree has-collapsable-children', =>
          @li class: 'list-nested-item', =>
            @span class: 'highlight'
            @div class: 'list-item', =>
              @span class: 'disclosure-arrow'
              @span class: 'icon icon-file-directory', 'A Directory'
            @ul class: 'list-tree', =>
              @li class: 'list-nested-item', =>
                @span class: 'highlight'
                @div class: 'list-item', =>
                  @span class: 'disclosure-arrow'
                  @span class: 'icon icon-file-directory', 'Nested Directory'
                @ul class: 'list-tree', =>
                  @li class: 'list-item', => @span class: 'icon icon-file-text', 'File one'
              @li class: 'list-nested-item collapsed', =>
                @span class: 'highlight'
                @div class: 'list-item', =>
                  @span class: 'disclosure-arrow'
                  @span class: 'icon icon-file-directory', 'Collpased Nested Directory'
                @ul class: 'list-tree', =>
                  @li class: 'list-item', => @span class: 'icon icon-file-text', 'File one'
              @li class: 'list-item', => @span class: 'icon icon-file-text', 'File one'
              @li class: 'list-item', => @span class: 'icon icon-file-text', 'File two'
              @li class: 'list-item selected', =>
                @span class: 'highlight'
                @span class: 'icon icon-file-text', 'File three .selected!'
          @li class: 'list-item', => @span class: 'icon icon-file-text', '.icon-file-text'
          @li class: 'list-item', => @span class: 'icon icon-file-symlink-file', '.icon-file-symlink-file'
          @li class: 'list-item', => @span class: 'icon icon-file-submodule', '.icon-file-submodule'
          @li class: 'list-item', => @span class: 'icon icon-file-media', '.icon-file-media'

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'h1.section-heading'
        @h2 class: 'section-heading', 'h2.section-heading'
        @h3 class: 'section-heading', 'h3.section-heading'

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'Inset Panel'
        @div class: 'inset-panel', =>
          @div class: 'panel-heading', =>
            @button class: 'btn btn-mini pull-right', 'Header Button'
            @code '.panel-heading'
          @div class: 'panel-body padded', =>
            @code '.panel-body.padded'

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'Error messages'
        @ul class: 'error-messages', outlet: 'errorMessages'

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'Loading spinners'
        @div class: 'loading is-loading pull-center loading-spinner-small', outlet: 'loadingMessage'

  initialize: ->
    @attach()

  attach: =>
    rootView.vertical.append(this)

