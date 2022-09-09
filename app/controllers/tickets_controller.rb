class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    if user_signed_in?
      @event = Event.find(params[:event_id])
      @ticket = Ticket.new(ticket_params)
      @ticket.event = @event
      @ticket.owner = current_user
      if @ticket.save
        redirect_to event_path(@event)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
    redirect_to my_profile_path
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to my_profile_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :seat, :code)
  end
end
