class VotesController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy, :vote_up, :vote_down]


  def vote_up
    @regulation= Regulation.find(params[:id])
    @regulation.update_attribute(:votes_up, @regulation.votes_up + 1)

  end

  def vote_down
    @regulation = Regulation.find(params[:id])
    @regulation.update_attribute(:votes_down, @regulation.votes_down + 1)
    redirect_to root_path
  end

end
