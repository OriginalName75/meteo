class AddTruc < ActiveRecord::Migration[5.0]
  def change
    add_column :rasbs, :username, :string
  end
end
