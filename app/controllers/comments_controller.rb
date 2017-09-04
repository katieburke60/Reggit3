class CommentsController < ApplicationController

  def create
    comment = Comment.new(description: params['description'])
    comment.action_id = params['action']['id']
    comment.save
    render json: comment
  end

end
