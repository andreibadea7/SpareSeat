class User < ApplicationRecord
  # Associations
  has_many :tickets, class_name: "Ticket", foreign_key: "owner_id"
  has_many :messages, class_name: "Message", foreign_key: "sender_id"
  has_one_attached :photo
  has_many :orders

  # Returns all chats
  def chats
    Chatroom.where("participant_one_id = ? OR participant_two_id = ?", id, id)
  end

  # Returns all the chats with a certain user
  def chats_with(interlocutor)
    chats.where("participant_one_id = ? OR participant_two_id = ?", interlocutor, interlocutor)
  end

  # Returns all transactions
  def transactions
    Order.where("seller_id = ? OR buyer_id = ?", id, id)
  end

  # Return full_name of user
  def full_name
    "#{first_name} #{last_name}"
  end

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
