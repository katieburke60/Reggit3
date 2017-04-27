require 'pry'
class CommentsController < ApplicationController

  def create
  regulation = Regulation.find(params[:regulation_id])
  comment = regulation.comments.create(comment)
  comment.save
  render json: comment
end

private

  def comment_params
    params.require(:comment).permit(:description, :regulation_id )
  end


end
