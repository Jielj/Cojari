class Budget < ApplicationRecord
  belongs_to :coproperty
  has_many :expenses, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :properties, through: :payments
  has_many_attached :photos
end
