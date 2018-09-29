class FixPerson2 < ActiveRecord::Migration
  def change
    rename_table :person, :persons
  end
end
