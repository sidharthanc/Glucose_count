class AddRoleTypeToRole < ActiveRecord::Migration
  def change
    change_table :roles do |t|
      t.references :subrole, polymorphic: true, index: true
    end
  end
end
