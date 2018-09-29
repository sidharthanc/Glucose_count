class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :address_type, index: true, foreign_key: true
      t.string   :address_line1, limit: 128
      t.string   :address_line2, limit: 128
      t.string   :state,         limit: 50
      t.string   :zip,           limit: 10
      t.string   :iso_country_code, null: false, limit: 3  # 2/3 char iso country code 
      t.timestamps null: false
    end
  end
end
