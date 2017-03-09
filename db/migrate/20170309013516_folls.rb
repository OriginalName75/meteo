class Folls < ActiveRecord::Migration[5.0]
  def change
  
    drop_table :user_to_lieu
    create_table :user_to_lieu, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :lieu, index: true
    end
  end
end
