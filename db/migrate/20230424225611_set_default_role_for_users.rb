class SetDefaultRoleForUsers < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :role_id, 1
  end

  def down
    change_column_default :users, :role_id, nil
  end
end
