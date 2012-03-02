//= require_tree ./lib

//= require spine
//= require spine/manager
//= require spine/route
//= require spine/ajax

//= require app/app

//= require_tree ./app/models
//= require_tree ./app/controllers
//= require_tree ./app/views

//= require ./app/main

$ ->
  
  window.cart = new App.Controllers.Cart
  window.nav  = new App.Controllers.Nav(el: $("div.navbar"))
  window.main = new App.Main(el: $("#main"))

  main.render()

  Spine.Route.setup 
    history: true

  $('body').on "click", "a.navigable", (e) ->
    main.navigate(e.currentTarget.pathname)
    e.preventDefault()