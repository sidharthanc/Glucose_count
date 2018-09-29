class ChangeAddressInPatient < ActiveRecord::Migration
  def change
    remove_column :patients,     :address_line1
    remove_column :patients,     :address_line2
    remove_column :patients,     :state
    remove_column :patients,     :zip
    remove_column :patients,     :country
    add_column :patients, :phone_number_id, :integer
    add_column :patients, :address_id, :integer
    add_foreign_key :patients, :phone_numbers
    add_foreign_key :patients, :addresses
  end
end
