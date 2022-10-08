class Owner < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :coproperties, through: :properties
end
