class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :payment_status
      t.float :payment_amount
      t.date :payment_date
      t.string :payment_title
      t.references :property, null: false, foreign_key: true
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
