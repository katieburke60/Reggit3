class CitizensController < ApplicationController

  def index
    account = (authenticate_or_request_with_http_token do |token, options|
      Account.from_token(token)
    end)
    citizen = account.citizen
    render json: citizen
  end
end
