class Chatroom < ApplicationRecord
  # Associations
  belongs_to :ticket
  belongs_to :participant_one, class_name: "User"
  belongs_to :participant_two, class_name: "User"
end
