@MeetUp.module "MeetingsApp", (MeetingsApp, App, Backbone, Marionette, $, _) ->
  
  class MeetingsApp.Router extends Marionette.AppRouter
    appRoutes:
      "": "list"
      "new": "newMeeting"
      
  API = 
    list: ->
      MeetingsApp.List.Controller.list()
    newMeeting: ->
      MeetingsApp.New.Controller.show()
      
  App.addInitializer ->
    new MeetingsApp.Router
      controller: API
      
  App.reqres.setHandler "meetings:collection", ->
    new Backbone.Collection [
        { id: 2, name: 'a' }
        { id: 3, name: 'b' }
        { id: 4, name: 'c' }
        { id: 6, name: 'd' }
      ]