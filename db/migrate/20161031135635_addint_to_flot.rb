class AddintToFlot < ActiveRecord::Migration[5.0]
  def change
    remove_column :mesures, :temperature
    add_column :mesures, :temperature, :float
  end
end
