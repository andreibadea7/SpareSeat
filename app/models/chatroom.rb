class Chatroom < ApplicationRecord
  # Associations
  has_many :messages
  belongs_to :participant_one, class_name: "User"
  belongs_to :participant_two, class_name: "User"

  # Returns the participants of a certain chatroom
  def participants
    User.where("id = ? OR id = ?", participant_one_id, participant_two_id)
  end

  # Returns the interlocutor of current user in a particular chatroom
  def interlocutor_of(current_user)
    participants.where.not("id = ?", current_user.id)
  end
end
