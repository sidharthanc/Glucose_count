class ChangePatient < ActiveRecord::Migration
  def change
    change_column :patients, :guardian_id, :integer, null: true
  end
end
