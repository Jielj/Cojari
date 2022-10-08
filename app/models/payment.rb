class Payment < ApplicationRecord
  belongs_to :property
  belongs_to :budget
end
