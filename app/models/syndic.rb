class Syndic < ApplicationRecord
  belongs_to :user
  has_many :coproperties
end
