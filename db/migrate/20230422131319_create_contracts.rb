class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.jsonb :terms_of_agreement, null: false, default: {}
      # t.string :value
      t.integer :agreement_type
      t.integer :status, default: 0, null: false
      t.string :legal_document
      # t.boolean :privacy_policy
      t.boolean :renewal_option

      t.timestamps
    end
    add_index :contracts, :terms_of_agreement, using: :gin
  end
end
