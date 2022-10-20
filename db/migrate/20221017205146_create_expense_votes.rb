class CreateExpenseVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_votes do |t|
      t.boolean :vote_up
      t.references :owner, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
