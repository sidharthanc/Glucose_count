class Add < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :person, index: true 
    end
  end
end
