class Motorcircle < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :image, presence: true
  validates :finance_fee, presence: true
  validates :option_to_purchase, presence: true
  validates :total_amount_payable, presence: true
  validates :duration, presence: true
end
