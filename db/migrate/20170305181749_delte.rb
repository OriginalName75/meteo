class Delte < ActiveRecord::Migration[5.0]
  def change
    drop_table :rasberries
  end
end
