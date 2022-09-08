class AddTicketSkuToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :sku, :string
  end
end
