class TableMeteo < ActiveRecord::Migration[5.0]
  def change
    create_table :mesures
    add_column :mesures, :temperature,:integer
    add_column :mesures, :t, :datetime
    
    
  end
  
end
