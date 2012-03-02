App.Controllers.Products.Index.List = class List extends Spine.Controller

  elements: 
    ".list": "listEl"

  constructor: ->
    Product.bind "refresh", @addAll
    super

  render: (category) ->
    @blankSlate(category)
    Product.changeCategory(category)
    @

  addAll: (items) =>
    @addOne item for item in items
    @trigger "added", items

  addOne: (item) ->
    @append new App.Controllers.Products.Index.Item(item: item).render().el

  blankSlate: (category) ->
    @html "<div class='item placcard'><h1>#{category.titleize()}</h1></div>"