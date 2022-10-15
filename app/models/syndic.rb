class Syndic < ApplicationRecord
  belongs_to :user
  has_many :coproperties, dependent: :destroy

  def full_name
    "#{syndic_name}"
  end
end
