{$$} = require 'space-pen'
ScrollView = require 'scroll-view'

URI = 'atom://ui-demo'

module.exports =
class UIDemoView extends ScrollView
  registerDeserializer(this)

  @URI: URI

  @content: ->
    @div class: 'ui-demo padded', =>

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'UI Demo'
        @p 'This plugin exercises all UI components and acts as a sort of style guide.'

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'Tool Panel'
        @p 'A container attached to some side of the Atom UI. This UI Demo is in a tool panel.'
        @exampleCode '''
          <div class="tool-panel panel-bottom padded">
            ...
          </div>
        '''
        @p => @raw 'Supports <code>.panel-bottom</code> and <code>.panel-left</code> classes.'

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'List Group'
        @p 'Use for anything that requires a list.'
        @exampleCode '''
          <ul class="list-group">
            <li class="list-item">Normal item</li>
            <li class="list-item selected">
              <div class="highlight"></div>
              This is the Selected item.
            </li>
            <li class="list-item subtle">Subtle</li>
            <li class="list-item info">Info</li>
            <li class="list-item success">Success</li>
            <li class="list-item warning">Warning</li>
            <li class="list-item error">Error</li>
          </ul>
        '''

        @h2 'With icons'
        @exampleCode '''
          <ul class="list-group">
            <li class="list-item">
              <span class="icon icon-file-directory">Using a span with an icon</span>
            </li>
            <li class="list-item">
              <i class="icon icon-file-directory"></i>With .icon-file-directory using &lt;i> tags
            </li>
            <li class="selected">
              <div class="highlight"></div>
              <i class="icon icon-file-directory"></i>Selected with .icon-file-directory
            </li>
            <li class="list-item"><span class="no-icon">With .no-icon</li>
            <li class="list-item"><i class="icon icon-file-text"></i>With icon-file-text</li>
            <li class="list-item"><i class="icon icon-file-media"></i>With icon-file-media</li>
            <li class="list-item"><i class="icon icon-file-symlink-file"></i>With icon-file-symlink-file</li>
            <li class="list-item"><i class="icon icon-file-submodule"></i>With icon-file-submodule</li>
            <li class="list-item"><i class="icon icon-book"></i>With icon-book</li>
          </ul>
        '''

        @h2 'In an .inset-panel'
        @exampleCode '''
          <div class="inset-panel">
            <div class="panel-heading">My list-group with icons</div>
            <div class="panel-body padded">
              <ul class="list-group">
                <li class="list-item"><i class="icon icon-file-text"></i>With icon-file-text</li>
                <li class="list-item"><i class="icon icon-file-media"></i>With icon-file-media</li>
                <li class="list-item"><i class="icon icon-book"></i>With icon-book</li>
              </ul>
            </div>
          </div>
        '''

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'List Tree'
        @p => @raw '<code>.list-tree</code>s are a special case of <code>.list-group</code>s'
        @exampleCode '''
          <ul class="list-tree has-collapsable-children">
            <li class="list-nested-item">
              <span class="highlight"></span>
              <div class="list-item">
                <span class="disclosure-arrow"></span><span class="icon icon-file-directory">A Directory</span>
              </div>
              <ul class="list-tree">
                <li class="list-nested-item">
                  <span class="highlight"></span>
                  <div class="list-item">
                    <span class="disclosure-arrow"></span><span class="icon icon-file-directory">Nested Directory</span>
                  </div>
                  <ul class="list-tree">
                    <li class="list-item"> <span class="icon icon-file-text">File one</span></li>
                  </ul>
                </li>
                <li class="list-nested-item collapsed">
                  <span class="highlight"></span>
                  <div class="list-item">
                    <span class="disclosure-arrow"></span><span class="icon icon-file-directory">Collpased Nested Directory</span>
                  </div>
                  <ul class="list-tree">
                    <li class="list-item"><span class="icon icon-file-text">File one</span></li>
                  </ul>
                </li>
                <li class="list-item"> <span class="icon icon-file-text">File one</span></li>
                <li class="list-item"> <span class="icon icon-file-text">File two</span></li>
                <li class="list-item selected">
                  <span class="highlight"></span>
                  <span class="icon icon-file-text">File three .selected!</span>
                </li>
              </ul>
            </li>
            <li class="list-item"><span class="icon icon-file-text">.icon-file-text</span></li>
            <li class="list-item"><span class="icon icon-file-symlink-file">.icon-file-symlink-file</span></li>
            <li class="list-item"><span class="icon icon-file-submodule">.icon-file-submodule</span></li>
            <li class="list-item"><span class="icon icon-file-media">.icon-file-media</span></li>
          </ul>
        '''

      @section class: 'bordered', =>
        @h1 class: 'section-heading', 'Inset Panel'
        @p 'Use inside another panel.'
        @h2 'Without a heading'
        @exampleCode '''
          <div class="inset-panel padded">
            ....
          </div>
        '''

        @h2 'With a heading'
        @exampleCode '''
          <div class="inset-panel">
            <div class="panel-heading">An inset-panel heading</div>
            <div class="panel-body padded">
              ....
            </div>
          </div>
        '''

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'Error messages'
        @ul class: 'error-messages', outlet: 'errorMessages'

      @section class: 'bordered', =>
        @h2 class: 'section-heading', 'Loading spinners'
        @div class: 'loading is-loading pull-center loading-spinner-small', outlet: 'loadingMessage'

  @exampleCode: (html) =>
    exhtml = html.replace(/</g, '&lt;')
    html = """
      <div class="example-code">
        <div class="example">
          #{html}
        </div>
        <pre><code>#{exhtml}</code></pre>
      </div>"""
    $$ => @raw html

  @deserialize: (options={}) ->
    new UIDemoView()

  initialize: ->

  serialize: ->
    deserializer: 'UIDemoView'

  getUri: -> URI

  getTitle: -> "UI Demo"

  isEqual: (other) ->
    other instanceof UIDemoView

