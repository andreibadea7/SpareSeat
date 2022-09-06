class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  monetize :amount_cents
end
