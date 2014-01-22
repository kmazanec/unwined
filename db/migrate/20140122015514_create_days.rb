class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date
      
      t.integer :savings

      t.boolean :beer, default: false
      t.boolean :wine, default: false
      t.boolean :liquor, default: false

      t.text :comment

      t.integer :calendar_id, null: false

      t.timestamps
    end
  end
end
