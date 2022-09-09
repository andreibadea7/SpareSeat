class AddCodeToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :code, :string
  end
end
