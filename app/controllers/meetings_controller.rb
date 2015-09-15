class MeetingsController < ApplicationController
  respond_to :json

  def index
    @meetings = Meeting.limit 50
    respond_with(@meetings)
  end

  def show
    @meetings = Meeting.find params[:id]
  end

  def update
    @meeting = Meeting.find params[:id]
    if @meeting.update_attributes params
      render :show
    else
      respond_with @meeting
    end
  end

  def create
    @meeting = Meeting.new
    if @meeting.update_attributes params
      render :show
    else
      respond_with @meeting
    end
  end

  def destroy
    meeting = Meeting.find params[:id]
    meeting.destroy
    render json: {}
  end

end
