class RemoveSellerIdAndBuyerIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :seller_id
    remove_column :orders, :buyer_id
  end
end
