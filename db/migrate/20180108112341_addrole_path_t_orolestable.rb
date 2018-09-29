class AddrolePathTOrolestable < ActiveRecord::Migration
  def change
  	add_column :roles, :route_path, :string
  end
end
