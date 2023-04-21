class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, index: true
      t.string :logo
      t.string :register_number
      t.jsonb :data, null: false, default: {}
      t.jsonb :location, null: false, default: {}
      t.integer :status, default: 0, null: false, index: true

      t.timestamps
    end
    add_index :organizations, :data, using: :gin
    add_index :organizations, :location, using: :gin
  end
end
