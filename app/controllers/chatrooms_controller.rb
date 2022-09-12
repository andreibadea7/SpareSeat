class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chats
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
