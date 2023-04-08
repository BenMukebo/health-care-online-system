class ChangeDataColumnTypeInHospitals < ActiveRecord::Migration[7.0]
  def change
    change_column :hospitals, :name, :varchar
    change_column :hospitals, :treatments_counter, :integer
    change_column :hospitals, :healthcare_requests_counter, :integer
    add_column :hospitals, :address, :jsonb, using: 'address::jsonb'
    add_column :hospitals, :status, :enum, default: 'active', null: false, enum: ['active', 'inactive']
    change_column :hospitals, :user_id, :integer
    change_column :hospitals, :data, :jsonb
  end
end
