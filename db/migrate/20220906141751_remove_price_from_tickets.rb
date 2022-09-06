class RemovePriceFromTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :price
  end
end
