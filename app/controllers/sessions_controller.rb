class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    account = Account.authenticate(account_params[:email], account_params[:password])
    if account
      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token}
    else
      render json: {error: "Bad username or password"}, status: 401
      #401 is unauthorized status code.
    end
  end


  private

  def account_params
    params.require(:account).permit(:email, :password)
  end


end
