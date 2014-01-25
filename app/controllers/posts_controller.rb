class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.create params[:post].permit(:title, :content, :image)
    @post.save ? redirect_to('/') : render('new')
  end

  def index
    @posts = Post.by_tag_or_all(params[:tag_id])
    @new_post = Post.new
  end

  def edit
    @post = Post.find_by(params[:post_id])
  end

  def update
  end

  def destroy
  end

  def show
    @post = Post.find_by(params[:post_id])
    @post_for_comment = Post.find_by(params[:post_id])
    @new_comment = Comment.new
  end

end
