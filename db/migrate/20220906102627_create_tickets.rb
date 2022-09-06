class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.boolean :for_sale
      t.float :price
      t.string :seat

      t.timestamps
    end
  end
end
