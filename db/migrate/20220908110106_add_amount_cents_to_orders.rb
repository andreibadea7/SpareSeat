class AddAmountCentsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :amount_cents, :integer, default: 0, null: false
  end
end
