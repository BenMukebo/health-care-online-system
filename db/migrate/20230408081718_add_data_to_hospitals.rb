class AddDataToHospitals < ActiveRecord::Migration[7.0]
  def change
    add_column :hospitals, :data, :jsonb
  end
end
