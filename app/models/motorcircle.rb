class Motorcircle < ApplicationRecord
  belongs_to :user

  validates :name, :image, :finance_fee, :option_to_purchase, :total_amount_payable, :duration, presence: true
end
