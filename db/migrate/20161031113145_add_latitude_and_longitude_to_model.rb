class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration[5.0]
  def change
    add_column :lieus, :latitude, :float
    add_column :lieus, :longitude, :float
    remove_column :lieus, :x
    remove_column :lieus, :y
  end
end
