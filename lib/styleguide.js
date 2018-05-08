const {CompositeDisposable} = require('atom')
const DOMListener = require('dom-listener')
let StyleguideView = null

const STYLEGUIDE_URI = 'atom://styleguide'

module.exports = {
  activate () {
    this.subscriptions = new CompositeDisposable()
    this.subscriptions.add(atom.workspace.addOpener(filePath => {
      if (filePath === STYLEGUIDE_URI) return this.createStyleguideView({uri: STYLEGUIDE_URI})
    }))
    this.subscriptions.add(atom.commands.add('atom-workspace', 'styleguide:show',
      () => atom.workspace.open(STYLEGUIDE_URI).then(() => {
        this.domListener = new DOMListener(document.querySelector('atom-workspace'))
        return this.domListener.add('.styleguide', 'keydown', event => {
          return this.styleguideView.onKeyDownScroll(event.keyCode)
        })
      })
    ))
  },

  deactivate () {
    this.subscriptions.dispose()
  },

  createStyleguideView (state) {
    if (StyleguideView == null) StyleguideView = require('./styleguide-view')
    this.styleguideView = new StyleguideView(state)
    return this.styleguideView
  }
}
