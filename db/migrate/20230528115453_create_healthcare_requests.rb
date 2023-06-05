class CreateHealthcareRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :healthcare_requests do |t|
      t.string :title
      t.boolean :received, default: false
      t.integer :valided
      t.jsonb :data
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
    add_index :healthcare_requests, :data, using: :gin
  end
end
