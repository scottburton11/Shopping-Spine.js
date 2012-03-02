App.Controllers.Products.Index.Item = class Item extends Spine.Controller

  tagName: "article"
  className: "product item"

  events: 
    "click" : "navigateToItem"

  constructor: ->
    super
    @item.bind "change", @render
    @item.bind "remove", @release

  render: =>
    @html JST["app/views/products/index/item"](@item)
    @

  navigateToItem: (e) ->
    @navigate(@item.url())
    e.preventDefault()

  release: =>
    @item.unbind "change", @render
    super
