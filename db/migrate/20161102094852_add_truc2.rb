class AddTruc2 < ActiveRecord::Migration[5.0]
  def change
    add_column :rasbs, :password, :string
    add_column :rasbs, :salt, :string
  end
end
