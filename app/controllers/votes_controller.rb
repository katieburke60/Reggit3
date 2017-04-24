class VotesController < ApplicationController

  def create

     @regulation = Regulation.find(params[:regulation_id])
     @allvotesForRegulation = @regulation.votes
     @specificVoteInstance = Votes.find(params[:id])
     @specificVoteInstance.update(vote_params)

     render json: regulation.votes

  end

  def vote_up
    @regulation= Regulation.find(params[:id])
    @vote = @regualtion.vote
    @regulation.update_attribute(:votes_up, @regulation.vote = "up")

  end

  def vote_down
    @regulation = Regulation.find(params[:id])
    @vote = @regulation.vote
    @regulation.update_attribute(:votes_down, @regulation.vote = "down")

  end
 private
 def vote_params

   params.require(:vote).permit(:regulation_id, :user_id)

 end
end
