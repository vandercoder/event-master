
class EventAttendingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    if already_signed_up
      flash[:alert] = "#{@user.name} already signed up to attend #{@event.event_name}!"
    else
      @event.attendees << @user
      flash[:notice] = "#{@user.name} now signed up to attend #{@event.event_name}"
    end

    redirect_to @event
  end

  def destroy
    event = Event.find(params[:event_id])
    attendee = event.attendees.find(params[:user_id])

    event.attendees.delete(attendee)
    respond_to do |format|
      format.html { redirect_to event_path(event), notice: "#{attendee.name} is no longer invited." }
      format.json { head :no_content }
    end
  end

  private

  def already_signed_up
    EventAttending.exists?(attendee_id: @user, attended_event_id: @event)
  end

end
