class CreateDoctorRoles < ActiveRecord::Migration
  def change
    create_table :doctor_roles do |t|

      t.timestamps null: false
    end
  end
end
