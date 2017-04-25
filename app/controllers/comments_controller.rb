class CommentsController < ApplicationController

  def create
      regulation = Regulation.find(params[:regulation_id])

     comment= regulation.comments.create(commment: params['comment'])
     render json: regulation.comments
  end


end
