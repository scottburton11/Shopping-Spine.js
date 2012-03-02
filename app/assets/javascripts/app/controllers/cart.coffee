App.Controllers.Cart = class Cart extends Spine.Controller
  @extend Spine.Events

  constructor: ->
    super
    @items = []

  add: (item) ->
    @items.push item.id
    @trigger "add", @items

  contains: (id) ->
    id in @items