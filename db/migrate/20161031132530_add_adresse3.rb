class AddAdresse3 < ActiveRecord::Migration[5.0]
  def change
    remove_column :lieus, :adress
    add_column :lieus, :address, :string
  end
end
