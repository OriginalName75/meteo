class AddUser < ActiveRecord::Migration[5.0]
  def change
    create_table :rasb do |t|
         t.string :username 
         t.string :password 
         t.string :salt
         t.timestamps
   end
  end
end
