class RemovePostCodeFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :post_code
  end
end
