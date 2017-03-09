class Relaionss < ActiveRecord::Migration[5.0]
  def change

    change_table :rasb_secs do |t|
      t.belongs_to :user, index: true

    end
    change_table :mesures do |t|
      t.belongs_to :rasb_sec, index: true

    end
  end
end
