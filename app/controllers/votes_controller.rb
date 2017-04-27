require 'pry'

class VotesController < ApplicationController

  def create
     vote = Vote.create(vote: params['vote'], regulation_id: params['regulation_id'])
     render json: vote
  end



end
