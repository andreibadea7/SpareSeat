class RemoveAmountFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :amount
  end
end
