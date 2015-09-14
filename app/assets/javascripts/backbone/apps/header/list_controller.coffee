@MeetUp.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  List.Controller =
  
    showHeader: ->
      collection = App.reqres.request "app:getRoutes"
      @headerView = @getHeaderView collection
      App.headerRegion.show @headerView
      
    refreshHeader: ->
      @headerView.render()
      
    getHeaderView: (collection) ->
      new List.Headers
        collection: collection