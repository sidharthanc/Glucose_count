class CreateSalutations < ActiveRecord::Migration
  def change
    create_table :salutations do |t|
      t.string   :salutation,         limit: 6, null: false
      t.timestamps null: false
    end
  end
end
