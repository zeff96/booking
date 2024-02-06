class User < ApplicationRecord
  has_secure_password

  has_many :motorcircles, dependent: :destroy
  validates :username, :email, presence: true
end
