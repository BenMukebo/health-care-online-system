class AddAddressToHospitals < ActiveRecord::Migration[7.0]
  def change
    add_column :hospitals, :address, :jsonb
  end
end
