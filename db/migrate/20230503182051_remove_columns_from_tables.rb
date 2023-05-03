class RemoveColumnsFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :picture, :string
    remove_column :hospitals, :logo, :string
    remove_column :organizations, :logo, :string
  end
end
