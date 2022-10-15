class Budget < ApplicationRecord
  belongs_to :coproperty
  has_many :expenses
  has_many :payments
  has_many :properties, through: :payments
  has_many_attached :photos
end
