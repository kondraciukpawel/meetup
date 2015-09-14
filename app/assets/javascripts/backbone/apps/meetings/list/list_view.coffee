@MeetUp.module "MeetingsApp.List", (List, App, Backbone, Marionette, $, _) ->
  
  class List.RowView extends Marionette.ItemView
    tagName: "tr"
    template: JST.meetings.list.row
    attributes: ->
      class: 'rowx'
    templateHelpers: ->
      rowIdx: @options.index + 1
  
  class List.TableView extends Marionette.CompositeView
    template: JST.meetings.list.view
    childView: List.RowView
    childViewContainer: "tbody"
    childViewOptions: (model, index) ->
      index: index