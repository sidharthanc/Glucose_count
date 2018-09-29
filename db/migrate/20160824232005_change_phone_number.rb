class ChangePhoneNumber < ActiveRecord::Migration
  def change
    rename_column :phone_numbers, :local_number, :phone_number
    remove_column :phone_numbers, :iso_country_code
  end
end
