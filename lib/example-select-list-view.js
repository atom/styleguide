/** @babel */

import SelectListView from 'atom-select-list'

export default class ExampleSelectListView {
  constructor (items) {
    this.selectListView = new SelectListView({
      items,
      elementForItem: (item) => {
        const li = document.createElement('li')
        li.textContent = item
        return li
      },
      onDidConfirmSelection: (item) => {
        console.log('confirmed', item)
      },
      onDidCancelSelection: () => {
        console.log('cancelled')
      }
    })
  }
}
