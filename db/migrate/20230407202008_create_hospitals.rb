class CreateHospitals < ActiveRecord::Migration[7.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false, index: true
      t.string :email, index: true
      t.string :phone_number
      t.string :register_number, limit: 8
      t.string :logo
      t.string :website
      t.jsonb :data, null: false, default: {}
      t.jsonb :address, null: false, default: {}
      t.text :terms_of_service
      t.integer :status, default: 0, null: false, index: true

      t.timestamps
    end

    add_index :hospitals, :data, using: :gin
    add_index :hospitals, :address, using: :gin
  end
end
