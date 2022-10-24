class Property < ApplicationRecord
  belongs_to :owner, optional: true
  belongs_to :coproperty
  has_many :payments, dependent: :destroy
  has_many :budgets, through: :payments
  has_many :links, dependent: :destroy
  has_many :requests, dependent: :destroy
end
