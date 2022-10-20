class Request < ApplicationRecord
  belongs_to :property
  has_many_attached :photos
end
