{$, ScrollView} = require 'atom'

require './space-pen-extensions'
ExampleSection = require './example-section'

module.exports =
class StyleguideView extends ScrollView
  @content: ->
    @div class: 'styleguide pane-item native-key-bindings', tabindex: -1, =>
      @button outlet: 'collapseAllButton', class: 'btn btn-collapse-all', 'Collapse All Sections'

      @exampleSection 'styleguide', 'Styleguide', ->
        @p 'This exercises all UI components and acts as a styleguide.'

      @exampleSection 'variables', 'Variables', ->
        @p => @raw '''Use these UI variables in your package's stylesheets. They are set by UI themes and therefore your package will match the overall look.'''

        @div class: 'variables-group', =>
          @h2 'Text colors'
          @exampleCode '''
            @div class: 'is-color text-color',           '@text-color'
            @div class: 'is-color text-color-subtle',    '@text-color-subtle'
            @div class: 'is-color text-color-highlight', '@text-color-highlight'
            @div class: 'is-color text-color-selected',  '@text-color-selected'
            @div class: 'is-color'
            @div class: 'is-color text-color-info',      '@text-color-info'
            @div class: 'is-color text-color-success',   '@text-color-success'
            @div class: 'is-color text-color-warning',   '@text-color-warning'
            @div class: 'is-color text-color-error',     '@text-color-error'
          '''
        @div class: 'variables-group', =>
          @h2 'Background colors'
          @exampleCode '''
            @div class: 'is-color background-color-info',      '@background-color-info'
            @div class: 'is-color background-color-success',   '@background-color-success'
            @div class: 'is-color background-color-warning',   '@background-color-warning'
            @div class: 'is-color background-color-error',     '@background-color-error'
            @div class: 'is-color'
            @div class: 'is-color background-color-highlight', '@background-color-highlight'
            @div class: 'is-color background-color-selected',  '@background-color-selected'
            @div class: 'is-color app-background-color',       '@app-background-color'
          '''
        @div class: 'variables-group', =>
          @h2 'Base colors'
          @exampleCode '''
            @div class: 'is-color base-background-color',  '@base-background-color'
            @div class: 'is-color base-border-color',      '@base-border-color'
          '''
        @div class: 'variables-group', =>
          @h2 'Component colors'
          @exampleCode '''
            @div class: 'is-color pane-item-background-color',  '@pane-item-background-color'
            @div class: 'is-color pane-item-border-color',      '@pane-item-border-color'
            @div class: 'is-color'
            @div class: 'is-color input-background-color',  '@input-background-color'
            @div class: 'is-color input-border-color',      '@input-border-color'
            @div class: 'is-color'
            @div class: 'is-color tool-panel-background-color',    '@tool-panel-background-color'
            @div class: 'is-color tool-panel-border-color',        '@tool-panel-border-color'
            @div class: 'is-color inset-panel-background-color',   '@inset-panel-background-color'
            @div class: 'is-color inset-panel-border-color',       '@inset-panel-border-color'
            @div class: 'is-color panel-heading-background-color', '@panel-heading-background-color'
            @div class: 'is-color panel-heading-border-color',     '@panel-heading-border-color'
            @div class: 'is-color overlay-background-color',       '@overlay-background-color'
            @div class: 'is-color overlay-border-color',           '@overlay-border-color'
            @div class: 'is-color'
            @div class: 'is-color button-background-color',          '@button-background-color'
            @div class: 'is-color button-background-color-hover',    '@button-background-color-hover'
            @div class: 'is-color button-background-color-selected', '@button-background-color-selected'
            @div class: 'is-color button-border-color',              '@button-border-color'
            @div class: 'color'
            @div class: 'is-color tab-bar-background-color',     '@tab-bar-background-color'
            @div class: 'is-color tab-bar-border-color',         '@tab-bar-border-color'
            @div class: 'is-color tab-background-color',         '@tab-background-color'
            @div class: 'is-color tab-background-color-active',  '@tab-background-color-active'
            @div class: 'is-color tab-border-color',             '@tab-border-color'
            @div class: 'is-color'
            @div class: 'is-color tree-view-background-color',   '@tree-view-background-color'
            @div class: 'is-color tree-view-border-color',       '@tree-view-border-color'
          '''
        @div class: 'variables-group', =>
          @h2 'Site colors'
          @exampleCode '''
            @div class: 'is-color ui-site-color-1',    '@ui-site-color-1'
            @div class: 'is-color ui-site-color-2',    '@ui-site-color-2'
            @div class: 'is-color ui-site-color-3',    '@ui-site-color-3'
            @div class: 'is-color ui-site-color-4',    '@ui-site-color-4'
            @div class: 'is-color ui-site-color-5',    '@ui-site-color-5'
          '''
        @div class: 'variables-group', =>
          @h2 'Sizes'
          @exampleCode '''
            @div class: 'is-size disclosure-arrow-size',    '@disclosure-arrow-size'
            @div class: 'is-size component-padding',        '@component-padding'
            @div class: 'is-size component-icon-padding',   '@component-icon-padding'
            @div class: 'is-size component-icon-size',      '@component-icon-size'
            @div class: 'is-size component-line-height',    '@component-line-height'
            @div class: 'is-size tab-height',               '@tab-height'
            @div class: 'is-size font-size',                '@font-size'
          '''
        @div class: 'variables-group', =>
          @h2 'Misc'
          @exampleCode '''
            @div class: 'is-radius component-border-radius',  '@component-border-radius'
            @div class: 'is-font font-family',                '@font-family'
          '''


      @exampleSection 'text', 'Text classes', ->
        @p => @raw 'There are a number of text classes.'

        @h2 'text-* classes'
        @exampleCode '''
          @p class: 'text-smaller', 'Smaller text'
          @div 'Normal text'
          @div class: 'text-subtle', 'Subtle text'
          @div class: 'text-highlight', 'Highlighted text'
          @div class: 'text-info', 'Info text'
          @div class: 'text-success', 'Success text'
          @div class: 'text-warning', 'Warning text'
          @div class: 'text-error', 'Error text'
        '''

        @h2 'highlight-* classes'
        @exampleCode '''
          @span class: 'inline-block', 'Normal text'
          @span class: 'inline-block highlight', 'Highlighted'
          @span class: 'inline-block highlight-info', 'Info'
          @span class: 'inline-block highlight-success', 'Success'
          @span class: 'inline-block highlight-warning', 'Warning'
          @span class: 'inline-block highlight-error', 'Error'
        '''

      @exampleSection 'layout', 'Layout classes', ->
        @p => @raw 'A few things that might be useful for general layout.'

        @h2 '.block'
        @p 'Sometimes you need to separate components vertically. Say in a form.'
        @exampleCode '''
          @div class: 'block', =>
            @label 'You might want to type something here.'
            @div class: 'editor mini editor-colors', 'Something you typed...'
          @div class: 'block', =>
            @label class: 'icon icon-file-directory', 'Another field with an icon'
            @div class: 'editor mini editor-colors', 'Something else you typed...'
          @div class: 'block', =>
            @button class: 'btn', 'Do it'
        '''

        @h2 '.inline-block'
        @p 'Sometimes you need to separate components horizontally.'
        @exampleCode '''
          @div class: 'block', =>
            @label 'This is a thing with stuff in it'
            @div =>
              @div class: 'inline-block editor mini editor-colors', 'Something you typed...'
              @div class: 'inline-block btn-group', =>
                @button class: 'btn', 'One'
                @button class: 'btn', 'Two'

          @div class: 'block', =>
            @button class: 'inline-block btn', 'Do it'
            @button class: 'inline-block btn', 'Another'
            @button class: 'inline-block btn', 'OMG again'
        '''

        @h2 '.inline-block-tight'
        @p 'You might want things to be a little closer to each other.'
        @exampleCode '''
          @div class: 'block', =>
            @button class: 'inline-block-tight btn', 'Do it'
            @button class: 'inline-block-tight btn', 'Another'
            @button class: 'inline-block-tight btn', 'OMG again'
        '''

      @exampleSection 'git', 'Git related classes', ->
        @p => @raw 'Often we need git related classes to specify status.'

        @h2 'status-* classes'
        @exampleCode '''
          @div class: 'status-ignored', 'Ignored'
          @div class: 'status-added', 'Added'
          @div class: 'status-modified', 'Modified'
          @div class: 'status-removed', 'Removed'
          @div class: 'status-renamed', 'Renamed'
        '''

        @h2 'status-* classes with related icons'
        @exampleCode '''
          @span class: 'inline-block status-ignored icon icon-diff-ignored', ''
          @span class: 'inline-block status-added icon icon-diff-added', ''
          @span class: 'inline-block status-modified icon icon-diff-modified', ''
          @span class: 'inline-block status-removed icon icon-diff-removed', ''
          @span class: 'inline-block status-renamed icon icon-diff-renamed', ''
        '''

      @exampleSection 'site-highlight', 'Site colors', ->
        @p => @raw 'Site colors are used for collaboration. A site is another collaborator.'

        @h2 'ui-site-* classes'
        @p => @raw '''
          These classes only set the background color, no other styles.
          You can also use LESS variables <code>@ui-site-#</code> in your plugins where
          <code>#</code> is a number between 1 and 5.
        '''
        @p => @raw '''
          Site colors will always be in the color progression you see here.
        '''
        @exampleCode '''
          @div class: 'block ui-site-1'
          @div class: 'block ui-site-2'
          @div class: 'block ui-site-3'
          @div class: 'block ui-site-4'
          @div class: 'block ui-site-5'
        '''

      @exampleSection 'buttons', 'Buttons', ->
        @p => @raw 'Buttons are similar to bootstrap buttons'

        @h2 'Standalone buttons'
        @exampleCode '''
          @div class: 'block', =>
            @button class: 'btn', 'Button'
          @div class: 'block', =>
            @button class: 'btn btn-xs', 'Extra Small Button'
          @div class: 'block', =>
            @button class: 'btn btn-sm', 'Small Button'
          @div class: 'block', =>
            @button class: 'btn btn-lg', 'Large Button'
        '''

        @h2 'Colored buttons'
        @exampleCode '''
          @div class: 'block', =>
            @button class: 'btn btn-primary inline-block-tight', 'Primary'
            @button class: 'btn btn-primary selected inline-block-tight', 'Selected Primary'

          @div class: 'block', =>
            @button class: 'btn btn-info inline-block-tight', 'Info'
            @button class: 'btn btn-info selected inline-block-tight', 'Selected Info'

          @div class: 'block', =>
            @button class: 'btn btn-success inline-block-tight', 'Success'
            @button class: 'btn btn-success selected inline-block-tight', 'Selected Success'

          @div class: 'block', =>
            @button class: 'btn btn-warning inline-block-tight', 'Warning'
            @button class: 'btn btn-warning selected inline-block-tight', 'Selected Warning'

          @div class: 'block', =>
            @button class: 'btn btn-error inline-block-tight', 'Error'
            @button class: 'btn btn-error selected inline-block-tight', 'Selected Error'
        '''

        @h2 'Button Groups'
        @exampleCode '''
          @div class: 'block', =>
            @div 'Normal size'
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div 'Extra Small'
            @div class: 'btn-group btn-group-xs', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div 'Small'
            @div class: 'btn-group btn-group-sm', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div 'Large'
            @div class: 'btn-group btn-group-lg', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
        '''

        @h2 'Button Toolbars'
        @exampleCode '''
          @div class: 'btn-toolbar', =>
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
            @div class: 'btn-group', =>
              @button class: 'btn', 'Four'
              @button class: 'btn', 'Five'
            @button class: 'btn', 'Six'
            @button class: 'btn', 'Seven'
        '''

        @h2 'Selected buttons'
        @p => @raw 'Buttons can be marked selected by adding a <code>.selected</code> class. Useful for toggle groups.'
        @exampleCode '''
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn selected', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn selected', 'Two'
              @button class: 'btn', 'Three'
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn', 'One'
              @button class: 'btn', 'Two'
              @button class: 'btn selected', 'Three'
          @div class: 'block', =>
            @div class: 'btn-group', =>
              @button class: 'btn selected', 'One'
              @button class: 'btn selected', 'Two'
              @button class: 'btn', 'Three'
        '''

      @exampleSection 'panels', 'Panels', ->
        @p => @raw 'Useful when you want a block of content with a heading.'

        @h2 'With a heading'
        @exampleCode '''
          @div class: "panel", =>
            @div class: "panel-heading", 'A .panel heading'
            @div class: "panel-body padded", 'Some Content goes here. I am padded!'
        '''

        @h2 'Bordered with a heading'
        @p => @raw 'You can add the class <code>.bordered</code> to the panel to add a border.'
        @exampleCode '''
          @div class: "panel bordered", =>
            @div class: "panel-heading", 'A .panel heading'
            @div class: "panel-body padded", 'Some Content goes here. I am padded!'
        '''

      @exampleSection 'tool-panel', 'Tool Panel', ->
        @p 'A container attached to some side of the Atom UI. This styleguide is in a tool panel.'
        @exampleCode '''
          @div class: 'tool-panel panel-bottom padded', =>
            @div 'Some content'
        '''
        @p => @raw 'Supports <code>.panel-bottom</code> and <code>.panel-left</code> classes.'

      @exampleSection 'inset-panel', 'Inset Panel', ->
        @p => @raw 'Use inside another panel, like a <code>.tool-panel</code>.'
        @h2 'Without a heading'
        @exampleCode '''
          @div class: "tool-panel panel-bottom padded", =>
            @div class: "inset-panel padded", 'Some content'
        '''

        @h2 'With a heading'
        @exampleCode '''
          @div class: "tool-panel panel-bottom padded", =>
            @div class: "inset-panel", =>
              @div class: "panel-heading", 'An inset-panel heading'
              @div class: "panel-body padded", 'Some Content'
        '''

        @h2 'With buttons in the heading'
        @exampleCode '''
          @div class: "tool-panel panel-bottom padded", =>
            @div class: "inset-panel", =>
              @div class: "panel-heading", =>
                @div class: 'btn-toolbar pull-right', =>
                  @div class: 'btn-group', =>
                    @button class: 'btn', 'Group Button'
                    @button class: 'btn', 'Second Group Button'
                  @button class: 'btn', 'A button'
                  @button class: 'btn selected', 'Selected'
                @span 'An inset-panel heading'
              @div class: "panel-body padded", 'Some Content'
        '''

      @exampleSection 'list-group', 'List Group', ->
        @p 'Use for anything that requires a list.'
        @exampleCode '''
          @ul class: 'list-group', =>
            @li class: 'list-item', 'Normal item'
            @li class: 'list-item selected', =>
              @span 'This is the Selected item.'
            @li class: 'list-item text-subtle', 'Subtle'
            @li class: 'list-item text-info', 'Info'
            @li class: 'list-item text-success', 'Success'
            @li class: 'list-item text-warning', 'Warning'
            @li class: 'list-item text-error', 'Error'
        '''

        @h2 'With icons'
        @exampleCode '''
          @ul class: 'list-group', =>
            @li class: 'list-item', =>
              @span class: 'icon icon-file-directory', 'Using a span with an icon'
            @li class: 'list-item', =>
              @i class: 'icon icon-file-directory', ''
              @span 'With .icon-file-directory using <i> tags'
            @li class: 'list-item selected', =>
              @span class: 'icon icon-file-directory', 'Selected with .icon-file-directory'
            @li class: 'list-item', =>
              @span class: 'no-icon', 'With .no-icon'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-text', 'With icon-file-text'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-media', 'With icon-file-media'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-symlink-file', 'With icon-file-symlink-file'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-submodule', 'With icon-file-submodule'
            @li class: 'list-item', =>
              @span class: 'icon icon-book', 'With icon-book'
        '''

        @h2 'In an .inset-panel'
        @exampleCode '''
          @div class: 'tool-panel panel-bottom padded', =>
            @div class: 'inset-panel', =>
              @div class: 'panel-heading', 'My list-group with icons'
              @div class: 'panel-body padded', =>
                @ul class: 'list-group', =>
                  @li class: 'list-item', =>
                    @span class: 'icon icon-file-text', 'With icon-file-text'
                  @li class: 'list-item', =>
                    @span class: 'icon icon-file-media', 'With icon-file-media'
                  @li class: 'list-item', =>
                    @span class: 'icon icon-book', 'With icon-book'
        '''

      @exampleSection 'list-tree', 'List Tree', ->
        @p => @raw 'A <code>.list-tree</code> is a special case of <code>.list-group</code>.'
        @exampleCode '''
          @ul class: 'list-tree', =>
            @li class: 'list-nested-item', =>
              @div class: 'list-item', =>
                @span class: 'icon icon-file-directory', 'A Directory'
              @ul class: 'list-tree', =>
                @li class: 'list-nested-item', =>
                  @div class: 'list-item', =>
                    @span class: 'icon icon-file-directory', 'Nested Directory'
                  @ul class: 'list-tree', =>
                    @li class: 'list-item', =>
                      @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-nested-item collapsed', =>
                  @div class: 'list-item', =>
                    @span class: 'icon icon-file-directory', 'Collpased Nested Directory'
                  @ul class: 'list-tree', =>
                    @li class: 'list-item', =>
                      @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-item', =>
                  @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-item selected', =>
                  @span class: 'icon icon-file-text', 'File three .selected!'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-text', '.icon-file-text'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-symlink-file', '.icon-file-symlink-file'
        '''

        @h2 'With disclosure arrows'
        @p => @raw 'Add the class <code>.has-collapsable-children</code> to give the children with nested items disclosure arrows.'
        @exampleCode '''
          @ul class: 'list-tree has-collapsable-children', =>
            @li class: 'list-nested-item', =>
              @div class: 'list-item', =>
                @span class: 'icon icon-file-directory', 'A Directory'
              @ul class: 'list-tree', =>
                @li class: 'list-nested-item', =>
                  @div class: 'list-item', =>
                    @span class: 'icon icon-file-directory', 'Nested Directory'
                  @ul class: 'list-tree', =>
                    @li class: 'list-item', =>
                      @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-nested-item collapsed', =>
                  @div class: 'list-item', =>
                    @span class: 'icon icon-file-directory', 'Collpased Nested Directory'
                  @ul class: 'list-tree', =>
                    @li class: 'list-item', =>
                      @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-item', =>
                  @span class: 'icon icon-file-text', 'File one'
                @li class: 'list-item selected', =>
                  @span class: 'icon icon-file-text', 'File three .selected!'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-text', '.icon-file-text'
            @li class: 'list-item', =>
              @span class: 'icon icon-file-symlink-file', '.icon-file-symlink-file'
        '''

        @h2 'With disclosure arrows at only one level.'
        @p => @raw 'Add the class <code>.has-flat-children</code> to sub-<code>.list-tree</code>s to indicate that the children will not be collapsable.'
        @exampleCode '''
          @ul class: 'list-tree has-collapsable-children ', =>
            @li class: 'list-nested-item', =>
              @div class: 'list-item', =>
                @span class: 'icon icon-file-text', 'This is a collapsable section'
              @ul class: 'list-tree has-flat-children', =>
                @li class: 'list-item', 'Something is here'
                @li class: 'list-item selected', 'Something .selected'
            @li class: 'list-nested-item', =>
              @div class: 'list-item', =>
                @span class: 'icon icon-file-directory', 'Another collapsable section'
              @ul class: 'list-tree has-flat-children', =>
                @li class: 'list-item', 'Something is here'
                @li class: 'list-item', 'Something else'
        '''

      @exampleSection 'overlay', 'Overlays', ->
        @p => @raw 'Overlays are like dialog boxes.'
        @p => @raw '''
          Supported classes: <code>.from-top</code>, <code>.from-bottom</code> and <code>.floating</code>.
          <code>.from-top</code> will come down from the top of the UI, etc.
        '''
        @exampleCode '''
          @div class: 'overlay from-top', =>
            @div 'Some content'
        '''

      @exampleSection 'select-list', 'Select List', ->
        @p => @raw '''
          You wont be creating a <code>.select-list</code> directly, but will do so
          by extending the <code>SelectListView</code> class. Your
          <code>SelectListView</code> will usually specify only the list items,
          and hide/show the errors or loading message.
        '''

        @p => @raw 'This is how you will typically specify a <code>.select-list</code>.'
        @exampleOverlaySelectList ['one', 'two', 'three']

        @p => @raw 'The list items have many options you can use, and shows you how they will display.'

        @h2 'Basic example with one item selected'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'selected', 'one'
              @li 'two'
              @li 'three'
        '''

        @h2 'Single line with icons'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'selected', =>
                @div class: 'status status-added icon icon-diff-added', ''
                @div class: 'icon icon-file-text', 'Some file'
              @li =>
                @div class: 'status status-modified icon icon-diff-modified', ''
                @div class: 'icon icon-file-text', 'Another file'
              @li =>
                @div class: 'status status-removed icon icon-diff-removed', ''
                @div class: 'icon icon-file-text', 'Yet another file'
        '''

        @h2 'Single line with key-bindings'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'selected', =>
                @div class: 'pull-right', =>
                  @kbd class: 'key-binding pull-right', '⌘⌥↓'
                @span class: 'icon icon-file-text', 'Some file'
              @li =>
                @div class: 'pull-right key-bindings', =>
                  @kbd class: 'key-binding', '⌘⌥A'
                  @kbd class: 'key-binding', '⌘⌥O'
                  @kbd class: 'key-binding', '⌘⌥1'
                  @kbd class: 'key-binding', '⌘⌥↓'
                  @kbd class: 'key-binding', '⌘⌥5'
                  @kbd class: 'key-binding', '⌘⌥↓'
                @span class: 'icon icon-file-text', 'Another file with a really long name'
              @li =>
                @div class: 'pull-right', =>
                  @kbd class: 'key-binding', '⌘⌥↓'
                @span class: 'icon icon-file-text', 'Yet another file'
        '''

        @h2 'Multiple lines with no icons'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'two-lines', =>
                @div class: 'primary-line', 'Primary line'
                @div class: 'secondary-line', 'Secondary line'
              @li class: 'two-lines selected', =>
                @div class: 'primary-line', 'A thing'
                @div class: 'secondary-line', 'Description of the thing'
        '''

        @h2 'Multiple lines with icons'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group', =>
              @li class: 'two-lines', =>
                @div class: 'status status-added icon icon-diff-added', ''
                @div class: 'primary-line icon icon-file-text', 'Primary line'
                @div class: 'secondary-line no-icon', 'Secondary line'
              @li class: 'two-lines selected', =>
                @div class: 'status status-modified icon icon-diff-modified', ''
                @div class: 'primary-line icon icon-file-symlink-file', 'A thing'
                @div class: 'secondary-line no-icon', 'Description of the thing'
              @li class: 'two-lines', =>
                @div class: 'status status-renamed icon icon-diff-renamed', ''
                @div class: 'primary-line icon icon-file-symlink-file', 'A thing'
                @div class: 'secondary-line no-icon', 'Description of the thing'
        '''

        @h2 'Using mark-active class to indicate the active item'
        @p => @raw 'Use ...'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @ol class: 'list-group mark-active', =>
              @li 'Normal item'
              @li class: 'selected', 'Selected &mdash; user is arrowing through the list.'
              @li class: 'active', 'This is the active item'
              @li class: 'selected active', 'Selected AND Active!'
        '''

        @h2 'Error messages'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @div class: 'editor editor-colors mini', 'I searched for this'
            @div class: 'error-message', 'Nothing has been found!'
        '''

        @h2 'Loading message'
        @exampleCode '''
          @div class: 'overlay from-top select-list', =>
            @div class: 'editor editor-colors mini', 'User input'
            @div class: 'loading', =>
              @span class: 'loading-message', 'Chill, bro. Things are loading.'
              @span class: 'badge', '1234'
        '''

      @exampleSection 'popover-list', 'Popover List', ->
        @p => @raw '''
          A <code>.popover-list</code> is a <code>.select-list</code> that
          is meant to popover the code for something like autocomplete.
        '''

        @h2 'Basic example with one item selected'
        @exampleCode '''
          @div class: 'select-list popover-list', =>
            @div class: 'editor mini editor-colors', 'User types here..'
            @ol class: 'list-group', =>
              @li class: 'selected', 'one'
              @li 'two'
              @li 'three'
        '''

      @exampleSection 'tooltips', 'Tooltips', ->
        @p => @raw '''
          You do not create the markup directly. You call
          <code>element.setTooltip(title, {command, commandElement}={})</code>.
          Passing in a <code>command</code> (like <code>find-and-replace:show-find</code>) and
          <code>commandElement</code> (context for the command) will yield a tip with a keystroke.
        '''

        @exampleCode '''
          @div class: 'tooltip top', =>
            @div class: 'tooltip-arrow'
            @div class: 'tooltip-inner', 'This is a message'

          @div class: 'tooltip top', =>
            @div class: 'tooltip-arrow'
            @div class: 'tooltip-inner', =>
              @raw 'With a keystroke <span class="keystroke">cmd-shift-o</span>'
        '''

      @exampleSection 'error-messages', 'Messages', ->
        @p => @raw '''
          Use to convey info to the user when something happens. See <code>find-and-replace</code>
          for an example.
        '''

        @h2 'Error messages'
        @exampleCode '''
          @ul class: 'error-messages block', =>
            @li 'This is an error!'
            @li 'And another'
        '''

        @h2 'Info messages'
        @exampleCode '''
          @ul class: 'info-messages block', =>
            @li 'Info line'
            @li 'Another info line'
        '''

      @exampleSection 'background-messages', 'Background Messages', ->
        @p => @raw '''
          Subtle background messages for panes. Use for cases when there are no results.
        '''

        @exampleCode '''
          @ul class: 'background-message', =>
            @li 'No Results'
        '''

        @p => @raw '''
          Centered background messages will center horizontally and vertically.
          Your container for this element must have <code>position</code> set with <code>relative</code> or
          <code>absolute</code>.
        '''

        @exampleCode '''
          @ul class: 'background-message centered', =>
            @li 'No Results'
        '''

      @exampleSection 'error-messages', 'Messages', ->
        @p => @raw '''
          Use to convey info to the user when something happens. See <code>find-and-replace</code>
          for an example.
        '''

        @h2 'Error messages'
        @exampleCode '''
          @ul class: 'error-messages block', =>
            @li 'This is an error!'
            @li 'And another'
        '''

      @exampleSection 'progress', 'Loading/Progress', ->

        @h2 'Progress Bars'
        @exampleCode '''
          @div class: 'block', =>
            @progress class: 'inline-block'
            @span class: 'inline-block', 'Indeterminate'

          @div class: 'block', =>
            @progress class: 'inline-block', max: '100', value: '25'
            @span class: 'inline-block', 'At 25%'

          @div class: 'block', =>
            @progress class: 'inline-block', max: '100', value: '50'
            @span class: 'inline-block', 'At 50%'

          @div class: 'block', =>
            @progress class: 'inline-block', max: '100', value: '75'
            @span class: 'inline-block', 'At 75%'

          @div class: 'block', =>
            @progress class: 'inline-block', max: '100', value: '100'
            @span class: 'inline-block', 'At 100%'
        '''

        @h2 'Loading Spinners'
        @exampleCode '''
          @span class: 'loading loading-spinner-tiny inline-block'
          @span class: 'loading loading-spinner-small inline-block'
          @span class: 'loading loading-spinner-medium inline-block'
          @span class: 'loading loading-spinner-large inline-block'
        '''

  @deserialize: (options={}) ->
    new StyleguideView(options)

  # sections are lazyloaded for speedup when reloading the app. I often am
  # editing just one section, and dont need to load the rest. When the user
  # clicks to expand a section, it will load said section.
  @exampleSections: {}
  @exampleSection: (name, title, buildFn) ->
    @exampleSections[name] = ExampleSection.build(this, name, title, buildFn)

  initialize: ({@uri, collapsedSections}={}) ->
    @on 'click', '.section-heading', ->
      StyleguideView.exampleSections[$(this).parent().attr('data-name')].toggle()

    @on 'click', '.example-code .btn-group .btn', ->
      btn = $(this)
      example = btn.parents('.example-code')
      clas = btn.attr('data-display-class')

      example.find('.btn').removeClass('selected')
      example.removeClass('show-example-html show-example-space-pen')
      example.addClass(clas)

      btn.addClass('selected')

    @collapseAllButton.click(@collapseAllSections)

    @append(section.el) for __, section of StyleguideView.exampleSections
    @setCollapsedSections(collapsedSections)

  serialize: ->
    deserializer: @constructor.name
    collapsedSections: @getCollapsedSections()
    uri: @getUri()

  getUri: -> @uri

  getTitle: -> "Styleguide"

  collapseAllSections: =>
    for name, section of StyleguideView.exampleSections
      continue if name == 'styleguide'
      section.collapse()

  getCollapsedSections: ->
    $(sec).attr('data-name') for sec in @find('section.collapsed')

  setCollapsedSections: (collapsedSections=[]) ->
    for name, section of StyleguideView.exampleSections
      section.expand() if name not in collapsedSections
    null

  isEqual: (other) ->
    other instanceof StyleguideView
