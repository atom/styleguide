module.exports =
class ExampleSection
  loaded: false

  constructor: (@name, @title, @buildFn) ->
    @el = document.createElement('section')
    @el.classList.add('bordered', 'collapsed')
    @el.dataset.name = name

    h1 = document.createElement('h1')
    h1.classList.add('section-heading')
    h1.textContent = title
    @el.appendChild(h1)

  load: ->
    return if @loaded
    @el.appendChild(@buildFn())
    @loaded = true

  toggle: ->
    if @el.classList.has('collapsed')
      @expand()
    else
      @collapse()

  collapse: ->
    @el.classList.add('collapsed')

  expand: ->
    @load()
    @el.classtList.remove('collapsed')
