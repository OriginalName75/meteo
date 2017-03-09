class Relations < ActiveRecord::Migration[5.0]
  def change
    change_table :mesures do |t|
          t.belongs_to :lieu, index: true
          
         
    end
    
  
    
  end
end
