class ChangeAddressInPerson < ActiveRecord::Migration
  def change
    remove_column :persons,     :address_line1
    remove_column :persons,     :address_line2
    remove_column :persons,     :state
    remove_column :persons,     :zip
    remove_column :persons,     :country
    add_column :persons, :phone_number_id, :integer
    add_column :persons, :address_id, :integer
    add_foreign_key :persons, :phone_numbers
    add_foreign_key :persons, :addresses
  end
end
