@MeetUp.module "MeetingsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  List.Controller =
  
    list: ->
      collection = App.request "meetings:entities"
      listView = @getListView collection
      App.mainRegion.show listView
      
    getListView: (collection) ->
      new List.TableView
        collection: collection