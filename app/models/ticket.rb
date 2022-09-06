class Ticket < ApplicationRecord
  belongs_to :event
  monetize :amount_cents
  belongs_to :owner, class_name: "User"
end
