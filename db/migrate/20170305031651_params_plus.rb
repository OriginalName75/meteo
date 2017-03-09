class ParamsPlus < ActiveRecord::Migration[5.0]
  def change
    
    add_column :users, :affichageMail, :boolean, default: false, null: false
    add_column :users, :affichageNomPrenom, :boolean, default: true, null: false
    
  end
end
