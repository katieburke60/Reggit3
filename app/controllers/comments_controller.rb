class CommentsController < ApplicationController

before_action :set_comment, only: [:show, :edit, :update]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @comment.to_json(only: [ :description, :id] ) }

    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Post.create(comment_params)
    @comment.save
    redirect_to comment_path(@comment)
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to comment_path(@comment)
  end

  def comment_data
    comment = Comment.find(params[:id])
    #render json: PostSerializer.serialize(post)
    render json: comment.to_json(only: [:description, :id],)
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit( :description)
  end
end
