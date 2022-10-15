class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :owner
  has_one :syndic

  def get_user_type
    if !self.owner.nil? || !self.syndic.nil?
      if self.owner.nil?
        return self.syndic
      else
        return self.owner
      end
    end
  end


end
