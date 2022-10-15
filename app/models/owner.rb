class Owner < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :coproperties, through: :properties

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
