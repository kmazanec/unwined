class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.boolean :admin, default: false
      t.integer :calendar_id

      t.timestamps
    end
  end
end
