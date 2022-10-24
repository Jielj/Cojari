class Coproperty < ApplicationRecord
  belongs_to :syndic
  has_many :properties, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :owners, through: :properties
  has_many :messages, dependent: :destroy
end
