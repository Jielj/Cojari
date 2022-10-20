class Expense < ApplicationRecord
  belongs_to :budget
  has_many_attached :photos
  has_many :expense_votes
end
