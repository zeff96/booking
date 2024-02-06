class User < ApplicationRecord
  has_secure_password

  has_many :motorcircles, dependent: :destroy
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
