class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chats
  end

  def create
    if current_user.chats_with(params[:chatroom][:participant_one_id]).present?
      @chatroom = current_user.chats_with(params[:chatroom][:participant_one_id]).first
      redirect_to chatroom_path(@chatroom)
    else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.name = "#{@chatroom.participant_one.first_name} & #{@chatroom.participant_two.first_name}"
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        render events_path, status: :unprocessable_entity
      end
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:participant_one_id, :participant_two_id)
  end
end
