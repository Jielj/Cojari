class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :building
      t.integer :propertie_number
      t.integer :total_property_area
      t.string :payment_frequency
      t.references :owner, null: true, foreign_key: true
      t.references :coproperty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
