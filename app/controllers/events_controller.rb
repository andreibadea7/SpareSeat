class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @events = Event.all
    @events = Event.joins(:venue)
                   .where("venues.name ILIKE ? OR events.name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
                   .order(:date)
                   .page params[:page]

    respond_to do |format|
      format.html
      format.text { render partial: "events/list", locals: { events: @events }, formats: [:html] }
    end
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @available_tickets = @event.tickets.where(for_sale: true).order("price_cents DESC")

    @venue = @event.venue

    @marker = [
      {
        lat: @venue.latitude,
        lng: @venue.longitude
      }
    ]

    @chatroom = Chatroom.new

  end
end
