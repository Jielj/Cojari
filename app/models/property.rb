class Property < ApplicationRecord
  belongs_to :owner
  belongs_to :coproperty
  has_many :payments
  has_many :budgets, through: :payments
end
