{$} = require 'atom-space-pen-views'

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
