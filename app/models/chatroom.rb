class Chatroom < ApplicationRecord
  # Associations
  has_many :messages
  belongs_to :participant_one, class_name: "User"
  belongs_to :participant_two, class_name: "User"

  def participants
    User.where("id = ? OR id = ?", participant_one_id, participant_two_id)
  end
end
