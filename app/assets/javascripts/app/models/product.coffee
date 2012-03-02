App.Models.Product = class Product extends Spine.Model
  @configure "Product", "id", "name", "designer_name", "price", "image_url", "description", "category"
  @extend Spine.Model.Ajax

  categoryUrl: ->
    "/#{@category.toLowerCase()}"

  @next_page: 1
  @per_page: 20
  @category: "MEN"

  @calculatePerPage: ->
    if @next_page is 1 then 19 else 20

  @changeCategory: (category) ->
    @next_page = 1
    @category = category.toUpperCase()
    @nextPage()

  @nextPage: (callback) ->
    @one "paginated", @handlePaging
    @one "paginated", callback if typeof callback is "function"
    Product.fetch 
      data:
        page:     Product.next_page
        per_page: Product.calculatePerPage()
        category: Product.category
      processData: true
      success: (data, status, xhr) =>
        @trigger("paginated", data, status, xhr)
  
  @handlePaging: (data, status, xhr) ->
    paginationHeader = xhr.getResponseHeader("X-Pagination")
    for segment in paginationHeader.split(", ")
      do (segment) =>
        [key, value] = segment.split(": ")
        Product[key] = parseInt(value)

  @hasMorePages: ->
    @page < @total_pages

window.Product = App.Models.Product