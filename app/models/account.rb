class Account < ApplicationRecord
  has_one :citizen
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def self.from_token(token)
    account_id = Auth.decode(token)['account_id'] #find the account ID using the token provided in the Authorization key in the http request header
    Account.find(account_id) #return the account object looking it up by the account ID.
  end

  def self.authenticate(email, password)
    account = Account.find_by(email: email)
    account && account.authenticate(password)
      #makes sure account exists and has correct password
  end


end
