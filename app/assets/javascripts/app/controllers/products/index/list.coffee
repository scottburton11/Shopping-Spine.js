App.Controllers.Products.Index.List = class List extends Spine.Controller

  elements: 
    ".list": "listEl"

  constructor: ->
    Product.bind "refresh", @addAll
    super

  render: (store) ->
    @blankSlate(store)
    Product.changeStore(store)
    @

  addAll: (items) =>
    @addOne item for item in items
    @trigger "added", items

  addOne: (item) ->
    @append new App.Controllers.Products.Index.Item(item: item).render().el

  blankSlate: (store) ->
    @html "<div class='item placcard'><h1>#{store.titleize()}</h1></div>"