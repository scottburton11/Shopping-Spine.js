App.Controllers.Products.Show.Main = class Main extends Spine.Controller
  tagName: "article"
  className: "detail"

  constructor: ->
    @detail = new App.Controllers.Products.Show.Detail()
    super    

  render: (item) ->
    @html @detail.render(item).el
    @active()
    @

  show: (params) =>
    if item = Product.exists(params.id)
      @render(item)
    else
      Product.nextPage =>
        Product.one "refresh", =>
          @show(params)