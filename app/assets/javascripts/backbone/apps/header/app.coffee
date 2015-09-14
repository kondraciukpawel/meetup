@MeetUp.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false

  API = 
    showHeader: ->
      HeaderApp.List.Controller.showHeader()
    refreshHeader: ->
      HeaderApp.List.Controller.refreshHeader()

  HeaderApp.on "start", ->
    API.showHeader()
    Backbone.history.on "all", (route, router) ->
      console.log App.getCurrentRoute()
      API.refreshHeader()