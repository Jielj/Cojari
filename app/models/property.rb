class Property < ApplicationRecord
  belongs_to :owner, optional: true
  belongs_to :coproperty
  has_many :payments
  has_many :budgets, through: :payments
  has_many :links
end
