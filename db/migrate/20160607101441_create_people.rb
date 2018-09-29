class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps null: false
    end
  end
end
