class AddAdresse2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :lieus, :adresse
    add_column :lieus, :adress, :string
  end
end
