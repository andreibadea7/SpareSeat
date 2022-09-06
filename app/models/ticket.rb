class Ticket < ApplicationRecord
  belongs_to :event
  monetize :price_cents
  belongs_to :owner, class_name: "User"
end
