class V1::SessionsController < ApplicationController
  skip_before_action :authenticate
  def create


  end
  private
  def account_params
    params.require(:account).permit(:username, :password)
  end
end
