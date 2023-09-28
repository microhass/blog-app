class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
    puts params
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
    puts params
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    puts params
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
