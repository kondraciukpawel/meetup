@MeetUp.module "MeetingsApp.New", (New, App, Backbone, Marionette, $, _) ->
  
  New.Controller =
  
    show: ->
      newView = @getNewView()
      App.mainRegion.show newView
      
    getNewView: ->
      new New.View