class Owner < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :coproperties, through: :properties
  has_one_attached :photo, dependent: :destroy

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
