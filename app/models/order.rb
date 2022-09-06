class Order < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :ticket

  monetize :amount_cents
end
