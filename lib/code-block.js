/** @babel */

import Highlights from 'highlights'

export default class CodeBlock {
  constructor (props) {
    this.highlighter = new Highlights({registry: atom.grammars, scopePrefix: 'syntax--'})
    this.wrapperElement = document.createElement('div')
    this.update(props)
  }

  update ({cssClass, grammarScopeName, code}) {
    this.wrapperElement.innerHTML = this.highlighter.highlightSync({fileContents: code, scopeName: grammarScopeName})
    this.element = this.wrapperElement.children[0]
    this.element.classList.remove('editor') // The `editor` class messes things up as `.editor` has absolutely positioned lines
    this.element.classList.add(cssClass)
    const fontFamily = atom.config.get('editor.fontFamily')
    if (fontFamily) {
      this.element.style.fontFamily = fontFamily
    }
  }
}
