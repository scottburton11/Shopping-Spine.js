App.Main = class Main extends Spine.Controller

  constructor: ->
    super

    @products = new App.Controllers.Products.Section(cart: @cart)

    @sections = [@products]

    @manager = new Spine.Manager(@sections...)

    @routes
      "/products"     :    @products.index.show
      "/products/:id" :    @products.show.show
      "/:category"    :    @products.index.show
      "/"             :    @products.index.show

  render: ->
    @append section.render().el for section in @sections
    @