App.Controllers.Products.Section = class Products extends Spine.Stack
  tagName: "section"

  constructor: ->
    @controllers = 
      index: App.Controllers.Products.Index.Main
      show:  App.Controllers.Products.Show.Main
    super

  render: ->
    @index.render()
    @