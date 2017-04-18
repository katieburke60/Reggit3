class Account < ApplicationRecord
  has_one :citizen
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password

  validates :username, presence: true, uniqueness: true


end
