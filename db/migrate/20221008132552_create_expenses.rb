class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :expense_name
      t.string :expense_type
      t.float :expense_amount
      t.date :expense_date
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
