class CreateAddressTypes < ActiveRecord::Migration
  def change
    create_table :address_types do |t|
      t.string :description, null: false, limit: 6
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
