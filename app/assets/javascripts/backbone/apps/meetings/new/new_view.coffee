@MeetUp.module "MeetingsApp.New", (New, App, Backbone, Marionette, $, _) ->
  
  class New.View extends Marionette.ItemView
    template: JST.meetings.create.view