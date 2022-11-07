class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :card_number
      t.string :phone_number
      t.date :ownership_date
      t.date :birth_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
