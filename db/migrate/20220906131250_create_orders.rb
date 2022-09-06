class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :ticket, null: false, foreign_key: true
      t.money :amount, currency: { present: false }
      t.string :checkout_session_id
      t.string :state

      t.timestamps
    end
  end
end
