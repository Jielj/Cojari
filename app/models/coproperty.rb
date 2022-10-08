class Coproperty < ApplicationRecord
  belongs_to :syndic
  has_many :properties
  has_many :budgets
  has_many :owners, through: :properties
end
