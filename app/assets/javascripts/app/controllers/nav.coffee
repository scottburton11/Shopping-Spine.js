App.Controllers.Nav = class Nav extends Spine.Controller

  elements:
    "#items_in_cart": "itemsInCartEl"

  constructor: ->
    window.cart.bind "add", @render
    super

  render: (items) =>
    @itemsInCartEl.html "#{items.length}"
    @