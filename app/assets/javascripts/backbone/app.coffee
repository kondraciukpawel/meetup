@MeetUp = do (Backbone, Marionette) ->

  App = new Marionette.Application
  
  App.addRegions
    headerRegion: '#header-region'
    mainRegion: '#main-region'
    footerRegion: '#footer-region'
    
  App.on "initializer:after", ->
    if Backbone.history
      Backbone.history.start()

  App