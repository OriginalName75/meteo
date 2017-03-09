class Pluss < ActiveRecord::Migration[5.0]
  def change
    add_column :mesures, :humidite, :float
    add_column :mesures, :pression, :float

  end
end
