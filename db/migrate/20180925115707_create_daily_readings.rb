class CreateDailyReadings < ActiveRecord::Migration
  def change
    create_table :daily_readings do |t|
      t.integer :reading
      t.integer :person_id
      t.datetime :date_done, index: true, null: false   
      t.timestamps null: false
    end
    add_foreign_key "daily_readings", "persons"
  end
end
