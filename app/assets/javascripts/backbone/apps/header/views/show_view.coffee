@MeetUp.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Header extends Marionette.ItemView
    template: JST.header.main
    tagName: "span"