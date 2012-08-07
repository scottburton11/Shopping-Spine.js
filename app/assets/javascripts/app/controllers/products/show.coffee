App.Controllers.Products.Show.Main = class Main extends Spine.Controller
  tagName: "article"
  className: "detail"

  constructor: ->
    super    

  render: (item) ->
    @detail.release() if @detail
    @detail = new App.Controllers.Products.Show.Detail()
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