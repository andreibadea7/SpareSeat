class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
      @my_tickets_selling = Ticket.where(owner: current_user).and(Ticket.where(for_sale: true))
    else
      redirect_to new_user_session_path
    end
    @my_tickets_purchased = Order.where(user: current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
