class NomAfficher < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :affichage, :integer, default: 0, null: false
    
    
  end
end
