class CreateCoproperties < ActiveRecord::Migration[7.0]
  def change
    create_table :coproperties do |t|
      t.string :coproperty_name
      t.integer :number_properties
      t.string :address
      t.string :expense_method
      t.integer :coprop_private_area
      t.integer :coprop_common_area
      t.integer :bank_account
      t.references :syndic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
