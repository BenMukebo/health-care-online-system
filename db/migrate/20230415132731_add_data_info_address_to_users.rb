class AddDataInfoAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :familly_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :matricule_number, :string, limit: 8
    add_column :users, :picture, :string
    add_column :users, :phone, :string
    add_column :users, :bio, :text
    add_column :users, :birth_date, :date
    add_column :users, :marital_status, :integer
    add_column :users, :gender, :string
    add_column :users, :data, :jsonb, null: false, default: '{}'
    add_column :users, :address, :jsonb, null: false, default: '{}'
    add_column :users, :phyisical_appearence , :jsonb, null: false, default: '{}'
    add_column :users, :agreed_to_terms, :boolean
    add_column :users, :status, :integer, default: 0, null: false
    add_reference :users, :role, null: false, foreign_key: true, index: true

    add_index :users, :matricule_number, unique: true
    add_index :users, :data, using: :gin
    add_index :users, :address, using: :gin
    add_index :users, :phyisical_appearence, using: :gin
  end
end
