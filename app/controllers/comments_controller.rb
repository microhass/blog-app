class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user&.id
    if @comment.save
      redirect_to user_post_path(current_user, @comment.post), notice: 'Comment created'
    else
      render :new, notice: 'Comment not created'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end
