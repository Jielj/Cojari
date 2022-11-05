class Message < ApplicationRecord
  belongs_to :coproperty
  belongs_to :user

  def message_sent?(user)
    if self.user == user
      return true
    end
      return false
  end


















end
