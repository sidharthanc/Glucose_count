class CreatePhoneNumberTypes < ActiveRecord::Migration
  def change
    create_table :phone_number_types do |t|
      t.string :description, null: false, limit: 6
      t.timestamps null: false
    end
  end
end
