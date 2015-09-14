@MeetUp = do (Backbone, Marionette) ->

  App = new Marionette.Application
  
  App.addRegions
    headerRegion: '#header-region'
    mainRegion: '#main-region'

  App.addInitializer ->
    App.module("HeaderApp").start()
    
  App.on 'start', ->
    @startHistory()
      
  App.reqres.setHandler "app:getRoutes", ->
    new Backbone.Collection [
      { name: 'Home', url: '' }
    ]

  App