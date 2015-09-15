@MeetUp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Meeting extends Backbone.Model
    urlRoot: -> Routes.meeting_path()

  class Entities.MeetingsCollection extends Backbone.Collection
    model: Entities.Meeting

    url: -> Routes.meetings_path()

  API =
    getMeetings: ->
      meetings = new Entities.MeetingsCollection
      meetings.fetch
        reset: true
      meetings

    getMeeting: (id) ->
      meeting = new Entities.Meeting
        id: id
      meeting.fetch()
      meeting

    newMeeting: ->
      new Entities.Meeting

  App.reqres.setHandler "meetings:entities", ->
    API.getMeetings()

  App.reqres.setHandler "meetings:entity", (id) ->
    API.getMeeting id

  App.reqres.setHandler "new:meetings:entity", ->
    API.newMeeting()