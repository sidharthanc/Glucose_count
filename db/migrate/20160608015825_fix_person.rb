class FixPerson < ActiveRecord::Migration
  def change
    rename_table :people, :person
  end
end
