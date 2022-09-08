class Order < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  monetize :amount_cents
end
