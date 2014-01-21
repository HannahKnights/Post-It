class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post].permit(:title, :content, :image)
    @post.save ? redirect_to(posts_path) : render('new')
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

end
