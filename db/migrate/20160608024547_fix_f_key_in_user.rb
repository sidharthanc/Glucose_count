class FixFKeyInUser < ActiveRecord::Migration
  def change
    add_foreign_key :users, :persons
  end
end
