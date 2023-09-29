class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
