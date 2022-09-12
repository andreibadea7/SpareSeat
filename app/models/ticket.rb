class Ticket < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :owner, class_name: "User"

  # Monetize Config
  monetize :price_cents
end
