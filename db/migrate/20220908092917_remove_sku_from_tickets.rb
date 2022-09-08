class RemoveSkuFromTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :sku
  end
end
