class AddNamesToPerson < ActiveRecord::Migration
  def change
    change_table :persons do |t|
      t.string :first_name, default: ""
      t.string :last_name, default: ""
      t.datetime :dob
      t.string :sex , limit: 1, default: ""
      t.string :email, limit: 255, default: "", null: false 
    end
  end
end
