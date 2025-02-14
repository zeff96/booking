class Motorcycle < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  has_many :reservations
end
