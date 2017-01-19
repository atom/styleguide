/** @babel */

import Highlights from 'highlights'

export default class CodeBlock {
  constructor (props) {
    this.highlighter = new Highlights({registry: atom.grammars})
    this.wrapperElement = document.createElement('div')
    this.update(props)
  }

  update ({cssClass, grammarScopeName, code}) {
    this.wrapperElement.innerHTML = this.highlighter.highlightSync({fileContents: code, scopeName: grammarScopeName})
    this.element = this.wrapperElement.children[0]
    this.element.classList.remove('editor') // The `editor` class messes things up as `.editor` has absolutely positioned lines
    this.element.classList.add(cssClass)
    const spans = this.element.querySelectorAll('span')
    for (let i = 0; i < spans.length; i++) {
      const span = spans[i]
      for (var j = span.classList.length - 1; j >= 0; j--) {
        const className = span.classList.item(j)
        span.classList.remove(className)
        span.classList.add(`syntax--${className}`)
      }
    }
    const fontFamily = atom.config.get('editor.fontFamily')
    if (fontFamily) {
      this.element.style.fontFamily = fontFamily
    }
  }
}
