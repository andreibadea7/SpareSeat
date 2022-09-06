class Order < ApplicationRecord
  # Associations
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :ticket

  # Monetize Config
  monetize :amount_cents
end
