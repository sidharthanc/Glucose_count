class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.references :phone_number_type, index: true, foreign_key: true
      t.string  :iso_country_code, null: false, limit: 3  # 2/3 char iso country code 
      t.string  :local_number, null: false, limit: 16     # local number (less country code)
      t.string  :extension, null: true, limit: 6
      t.timestamps null: false
    end
  end
end
