class Expense < ApplicationRecord
  belongs_to :budget
  has_many_attached :photos
end
