class Links < ActiveRecord::Migration[5.0]
  def change
    change_table :rasb_secs do |t|
      t.belongs_to :lieu, index: true

    end
    add_column :lieus, :lastMesureUpdate, :datetime

  end
end
