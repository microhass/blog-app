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
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = params[:user_id]
    @post.save

    redirect_to user_posts_path
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to user_posts_path
  end
end
