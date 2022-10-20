class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.text :encrypted_key
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
