require 'pry'
class VotesController < ApplicationController

  def create
    regulation = Regulation.find(params[:regulation_id])
     vote = regulation.votes.create(vote: params['vote'])
    #  Vote.create(vote: params['vote'], regulation_id: params['regulation_id'])
     render json: regulation.votes
  end

end
