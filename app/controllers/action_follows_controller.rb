class ActionFollowsController < ApplicationController

  def create
    account = (authenticate_or_request_with_http_token do |token, options|
      Account.from_token(token)
    end)
    action = Action.find(params['action_id'])
    if account && action
      actionFollow = ActionFollow.create(action_id: action.id, citizen_id: account.citizen.id, following: true)
      render json: actionFollow
    else
      render json: {error: "Unable to follow action"}, status: 401
    end
  end

  def update
    account = (authenticate_or_request_with_http_token do |token, options|
      Account.from_token(token)
    end)
    citizen = account.citizen
    binding.pry
    actionFollow = Action.find(params['action_id']).actionFollow.where("citizen_id = '#{citizen.id}'")
    if account && actionFollow
      !actionFollow.following
      actionFollow.save
      render json: actionFollow
    else
      render json: {error: "Unable to update follow status for this action"}, status: 401
    end
  end



end
