class EventsController < ApplicationController
  def index
    @events = Event.all.limit(10)
    # raise
    @events = Event.joins(:venue).where("venues.name ILIKE ? OR events.name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")

    respond_to do |format|
      format.html
      format.text { render partial: "events/list", locals: { events: @events }, formats: [:html] }
    end
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @available_tickets = @event.tickets.where(for_sale: true)
  end
end
