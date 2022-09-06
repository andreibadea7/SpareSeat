class ChangeFloatToMonetizeOnPriceInTickets < ActiveRecord::Migration[7.0]
  def change
    add_monetize :tickets, :price, currency: { present: false }
  end
end
