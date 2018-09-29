class AddSexToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :sex , :string, limit: 1, default: ""
  end
end
