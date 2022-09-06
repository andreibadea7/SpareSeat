class Chatroom < ApplicationRecord
  belongs_to :ticket
  belongs_to :buyer
end
