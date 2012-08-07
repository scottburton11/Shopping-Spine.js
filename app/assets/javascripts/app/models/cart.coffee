App.Models.Cart = class Cart extends Spine.Module
  @include Spine.Events

  constructor: ->
    @items = []

  add: (item) ->
    @items.push item
    @trigger "add", @items

  contains: (item) ->
    item.id in @items.map (item) -> item.id

  totalPrice: ->
    @items.map((item)-> item.price_cents).reduce (t, s) -> t + s

  length: ->
    @items.length