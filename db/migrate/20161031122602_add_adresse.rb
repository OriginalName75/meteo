class AddAdresse < ActiveRecord::Migration[5.0]
  def change
    add_column :lieus, :adresse, :string
  end
end
