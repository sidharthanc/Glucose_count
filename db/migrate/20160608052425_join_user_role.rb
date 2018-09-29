class JoinUserRole < ActiveRecord::Migration
  def change
    create_join_table :persons, :roles , column_options: { null: true } do |t|
      t.index :person_id
      t.index :role_id
end
  end
end
