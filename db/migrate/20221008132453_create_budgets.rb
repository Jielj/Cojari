class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :budget_title
      t.string :budget_status
      t.float :budget_amount
      t.date :budget_start_date
      t.date :budget_end_date
      t.string :budget_type
      t.references :coproperty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
