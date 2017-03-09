class AddRel < ActiveRecord::Migration[5.0]
  def change
    change_table :mesures do |t|
      t.belongs_to :rasb, index: true

    end
  end
end
