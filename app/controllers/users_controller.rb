class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
      @my_tickets = Ticket.where(owner: current_user)
    else
      redirect_to new_user_session_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end
end
