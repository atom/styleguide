{$} = require 'atom-space-pen-views'
SelectorLinter = require 'atom-selector-linter'

describe "Style Guide", ->
  workspaceElement = null

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    waitsForPromise ->
      atom.packages.activatePackage("styleguide")

  describe "the styleguide:show command", ->
    styleGuideView = null

    beforeEach ->
      atom.commands.dispatch(workspaceElement, "styleguide:show")

      styleGuideView = null
      waitsFor ->
        styleGuideView = atom.workspace.getActivePaneItem()

    it "opens the style guide", ->
      expect(styleGuideView.text()).toContain("Styleguide")

    it "doesn't use deprecated selectors", ->
      linter = new SelectorLinter

      examples = styleGuideView.find(".example-rendered")
      expect(examples.length).toBeGreaterThan(10)

      examples.each (_, example) ->
        eachSelector example, (element, selector) ->
          unless element.webkitMatchesSelector("atom-text-editor[mini]")
            linter.check(selector, packageName: "styleguide", sourcePath: "view")

      expect(linter.getDeprecations()).toEqual({})

# Call `callback` once for each node in the subtree `element`.
# Pass in the node and a CSS selector for the node.
eachSelector = (element, callback, prefix="") ->
  selector = prefix + " " + element.nodeName.toLowerCase()
  for klass in element.className.split(" ")
    selector += "." + klass

  callback(element, selector)
  for child in element.children
    eachSelector(child, callback, selector)
