class ExpenseVote < ApplicationRecord
  belongs_to :owner
  belongs_to :expense
end
