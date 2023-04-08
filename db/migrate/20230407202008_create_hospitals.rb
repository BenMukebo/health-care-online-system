class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.integer :treatments_counter, default: 0
      t.integer :healthcare_requests_counter,  default: 0
      t.jsonb :data, null: false, default: '{}'
      t.jsonb :address,  null: false, default: '{}'
      t.integer :status, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :hospitals, :name, unique: true
    add_index :hospitals, :data, using: :gin
    add_index :hospitals, :address, using: :gin
    add_index :hospitals, :status
  end
end
