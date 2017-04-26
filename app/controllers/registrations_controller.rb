class RegistrationsController < ApplicationController
  def create
    account = Account.new(account_params)
    if account.save
      payload = {account_id: account.id}
    else
    end
  end

  private
  def account_params
    params.require(:account).permit(:email, :password)
  end

end
