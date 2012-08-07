App.Controllers.Products.Show.Detail = class Detail extends Spine.Controller

  elements:
    "button" : "buttonEl"

  events: 
    "click button" : "addToCart"

  constructor: ->
    super
    App.cart.bind "add", @handleButtonState

  render: (item) ->
    @item = item
    @html JST["app/views/products/show/detail"](@item)
    @handleButtonState()
    @

  handleButtonState: =>
    if App.cart.contains @item
      @buttonEl.attr "disabled", "disabled"
      @buttonEl.addClass "disabled"
      @buttonEl.text "In cart"
    else
      @buttonEl.removeAttr "disabled"
      @buttonEl.removeClass "disabled"
      @buttonEl.text "Add to cart"
    @refreshElements()


  addToCart: (e) =>
    App.cart.add(@item)

  release: ->
    App.cart.unbind "add", @handleButtonState
    super
