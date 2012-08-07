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



  App.cart        = new App.Models.Cart
  App.cartView    = new App.Controllers.Cart(el: $("#cart-wrap"), cart: App.cart)
  App.nav         = new App.Controllers.Nav(el: $("div.navbar"))
  App.main        = new App.Main(el: $("#main"))

  window.cart     = App.cart
  window.cartView = App.cartView
  window.nav      = App.nav
  window.main     = App.main


  main.render()
  cartView.render()

  Spine.Route.setup 
    history: true

  $('body').on "click", "a.navigable", (e) ->
    main.navigate(e.currentTarget.pathname)
    e.preventDefault()