class Ticket < ApplicationRecord
  # Associations
  belongs_to :event
  belongs_to :owner, class_name: "User"
  has_many :orders

  # Monetize Config
  monetize :price_cents
end
