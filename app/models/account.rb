class Account < ApplicationRecord
  has_one :citizen
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password

  def self.authenticate(email, password)
    account = Account.find_by(email: email)
    account && account.authenticate(password)
    #makes sure account exists and has correct password
  end

end
