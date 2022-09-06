class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :venues, :capactiy, :capacity
  end
end
