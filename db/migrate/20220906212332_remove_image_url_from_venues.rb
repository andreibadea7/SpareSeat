class RemoveImageUrlFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :image_url
  end
end
