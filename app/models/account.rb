class Account < ApplicationRecord
  has_one :citizen
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password

end
