class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :state
      t.string :zip
      t.string :country
      t.datetime :dob 
      t.string :email, limit: 255, default: "", null: false , index: true

      # person
      t.integer  :person_id,   null: true


      # guardian 
      t.integer  :guardian_id, null: false
    

      # doctor 
      t.integer  :doctor_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :patients, :persons, column: :person_id
    add_foreign_key :patients, :persons, column: :guardian_id
    add_foreign_key :patients, :persons, column: :doctor_id
  end
end
