class CommentsController < ApplicationController

  def create
    comment = Comment.new(description: params['description'])
    comment.regulation_id = params['regulation']['id']
    comment.save
    render json: comment
  end

end
