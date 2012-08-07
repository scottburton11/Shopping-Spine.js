App.Controllers.Products.Index.Main = class Main extends Spine.Controller
  className: "index"

  elements:
    ".waypoint": "waypoint"
    ".list": "listEl"

  constructor: ->
    super
    
  render: ->
    @html JST["app/views/products/index/list"](store: @store)
    @list = new App.Controllers.Products.Index.List(el: @listEl)
    @list.bind "added", @setupWaypoint
    @

  show: (params) =>
    store = (params and params.store) or "men"
    unless @store is store
      @store = store
      @list.render(@store)
    @active()

  setupWaypoint: =>
    if Product.hasMorePages() then @rebindWaypoint() else @unbindWaypoint()

  rebindWaypoint: =>
    if $.waypoints().length is 0 
      @log "first bind"
      @bindWaypoint() 
    else 
      @log "rebind", $.waypoints(), @waypoint.offset().top
      $.waypoints("refresh")

  bindWaypoint: =>
    @waypoint.waypoint @waypointReached,
      offset: "99%",
      onlyOnScroll: true

  unbindWaypoint: =>
    @waypoint.waypoint("destroy")

  waypointReached: (event, direction) =>
    Product.nextPage() if direction is "down"