class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @available_tickets = @event.tickets.where(for_sale: true)
  end
end
