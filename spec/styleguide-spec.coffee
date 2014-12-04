describe "Style Guide", ->
  workspaceElement = null

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    waitsForPromise ->
      atom.packages.activatePackage("styleguide")

  describe "the styleguide:show command", ->
    it "opens the style guide", ->
      atom.commands.dispatch(workspaceElement, "styleguide:show")

      styleGuideView = null
      waitsFor ->
        styleGuideView = atom.workspace.getActivePaneItem()

      runs ->
        expect(styleGuideView.text()).toContain("Styleguide")
