require 'pry'

class VotesController < ApplicationController

  def create
    account = (authenticate_or_request_with_http_token do |token, options|
      Account.from_token(token)
    end)
    vote = Vote.create(vote: params['vote'], action_id: params['regulation_id'], citizen_id: account.citizen.id)
    render json: vote
  end

  def index
    votes = Vote.where(action_id: params['action_id'])
    render json: votes
  end



end
