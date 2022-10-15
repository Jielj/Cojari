class Payment < ApplicationRecord
  belongs_to :property
  belongs_to :budget
  has_many_attached :photos
end
