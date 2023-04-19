class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false, index: true
      t.jsonb :address, null: false, default: {}
      t.jsonb :data, null: false, default: {}
      t.integer :status, default: 0, null: false, index: true

      t.timestamps
    end

    add_index :hospitals, :data, using: :gin
    add_index :hospitals, :address, using: :gin
  end
end
