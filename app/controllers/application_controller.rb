class ApplicationController < ActionController::API
  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end
end
