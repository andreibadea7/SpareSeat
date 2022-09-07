class Message < ApplicationRecord
  # Assocations
  belongs_to :chatroom
  belongs_to :recipient
  belongs_to :sender
end
