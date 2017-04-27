require 'pry'
class VotesController < ApplicationController
     def create

       regulation = Regulation.find(params[:regulation_id])
       vote = regulation.votes.create(vote)
       vote.save
       #  Vote.create(vote: params['vote'], regulation_id: params['regulation_id'])
       render json: regulation.votes
      end

private
def vote_params
  params.require(:vote).permit(:vote, :regulation_id)
end

end
