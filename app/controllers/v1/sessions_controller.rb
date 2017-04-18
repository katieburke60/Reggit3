class V1::SessionsController < ApplicationController

  skip_before_action :authenticate
  def create

   account = Account.authenticate(account_params[:username], account_params[:password])
   if account
     payload = {acount_id: account.id}
     token = Auth.issue(payload)
     render json: {jwt: token}
  else
  render json: {error: "username or password is wrong"},status: 401
  end
end

  private
  def account_params
    params.require(:account).permit(:username, :password)
  end

end
