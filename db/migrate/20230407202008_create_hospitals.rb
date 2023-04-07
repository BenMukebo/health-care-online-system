class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.text :info
      t.string :address
      t.integer :treatments_counter
      t.integer :healthcare_requests_counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
