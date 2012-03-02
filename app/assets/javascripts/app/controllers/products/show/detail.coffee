App.Controllers.Products.Show.Detail = class Detail extends Spine.Controller

  elements:
    "button" : "buttonEl"

  events: 
    "click button" : "addToCart"

  constructor: ->
    window.cart.bind "add", @handleButtonState
    super

  render: (item) ->
    @item = item
    @html JST["app/views/products/show/detail"](@item)
    @handleButtonState()
    @buttonEl.on "click", @addToCart
    @

  handleButtonState: =>
    if window.cart.contains @item.id
      @buttonEl.attr "disabled", "disabled"
      @buttonEl.addClass "disabled"
    else
      @buttonEl.removeAttr "disabled"
      @buttonEl.removeClass "disabled"
    @refreshElements()


  addToCart: (e) =>
    window.cart.add(@item)

  release: ->
    window.cart.unbind "add", @handleButtonState
    super
