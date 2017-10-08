class ActionFollowsController < ApplicationController

  def create
    action = Action.find(params['action_id'])
    if account && action
      actionFollow = ActionFollow.create(action_id: action.id, account_id: account.id)
      render json: actionFollow
    else
      render json: {error: "Unable to follow action"}, status: 401
    end
  end



end
