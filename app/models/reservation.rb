class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle

  validates :date, presence: true
  validates :city, presence: true
  validates :date, uniqueness: {scope: :city, message: "already has a reservation in this city"}
end
