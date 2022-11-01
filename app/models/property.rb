class Property < ApplicationRecord
  belongs_to :owner, optional: true
  belongs_to :coproperty
  has_many :payments, dependent: :destroy
  has_many :budgets, through: :payments
  has_many :links, dependent: :destroy
  has_many :requests, dependent: :destroy

  def paid
    self.payments && self.payments.where("payment_status = 'Reçu'").count != 0
    # self.payments.where(payment_status: "Reçu").sum(:amount)
  end
end
