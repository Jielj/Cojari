class CreateSyndics < ActiveRecord::Migration[7.0]
  def change
    create_table :syndics do |t|
      t.string :syndic_name
      t.date :creation_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
