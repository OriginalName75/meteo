class Foll < ActiveRecord::Migration[5.0]
  def change
    create_table :user_to_lieu do |t|
      
      t.belongs_to :user, index: true
      t.belongs_to :lieu, index: true
    end
  end
end
