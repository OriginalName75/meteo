class OpenWe < ActiveRecord::Migration[5.0]
  def change
    add_column :lieus, :openW, :int
  end
end
