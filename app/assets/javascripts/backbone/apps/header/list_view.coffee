@MeetUp.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Header extends Marionette.ItemView
    template: JST.header.header
    tagName: "li"
    attributes: ->
      if App.getCurrentRoute() == @model.attributes.url
        return {
          class: "active"
        }
    
  class List.Headers extends Marionette.CompositeView
    template: JST.header.headers
    childView: List.Header
    childViewContainer: "ul"