class CreateRasbs < ActiveRecord::Migration[5.0]
  def change
    create_table :rasbs do |t|
    
      t.timestamps
    end
  end
end
