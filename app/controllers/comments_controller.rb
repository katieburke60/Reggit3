class CommentsController < ApplicationController

def create
  comment = make_comment(Comment.new, comment_params)
  comment.save
  render json: comment
end

private

  def make_comment(comment, params)
    comment.regulation = Regulation.find_or_create_by(params["regulation_id"])
    # comment.citizen = Citizen.find_or_create_by(citizen: params["citizen_id"])
    comment.description = params["description"]
    comment
  end

  def comment_params
    params.require(:comment).permit(:description, :regulation_id, :user_id)
  end

end
