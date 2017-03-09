class Nom < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :username, :string
    
    
  end
end
