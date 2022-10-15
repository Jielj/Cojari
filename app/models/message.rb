class Message < ApplicationRecord
  belongs_to :coproperty
  belongs_to :user
end
