class Message < ApplicationRecord
  # Assocations
  belongs_to :chatroom
  belongs_to :sender, class_name: "User"
end
