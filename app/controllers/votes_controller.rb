require 'pry'

class VotesController < ApplicationController

  def create
     Vote.create(vote: params['vote'], regulation_id: params['regulation_id'])
  end



end
