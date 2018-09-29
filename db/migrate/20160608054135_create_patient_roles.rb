class CreatePatientRoles < ActiveRecord::Migration
  def change
    create_table :patient_roles do |t|

      t.timestamps null: false
    end
  end
end
