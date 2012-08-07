App.Controllers.Cart = class Cart extends Spine.Controller

  constructor: ->
    super
    @cart.bind "add", @render

  render: (items) =>
    @html JST["app/views/cart"](items: @items(), totalPrice: @totalPrice())
    @

  items: ->
    length = @cart.length()
    if length > 0
      if length > 1
        "#{length} items"
      else
        "#{length} item"

  totalPrice: ->
    if @cart.length() > 0
      "$" + @cart.totalPrice()/100