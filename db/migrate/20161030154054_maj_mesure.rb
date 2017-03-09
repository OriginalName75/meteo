class MajMesure < ActiveRecord::Migration[5.0]
  def change
    add_column :mesures, :vitessevent, :integer
    
  end
end
