class AddDefaultToForSaleInTickets < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :for_sale, :boolean, default: true
  end
end
