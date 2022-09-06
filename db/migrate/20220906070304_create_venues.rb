class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :post_code
      t.integer :capactiy
      t.string :image_url

      t.timestamps
    end
  end
end
