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
    if params[:tag_id]
      @posts = Tag.find(params[:tag_id]).posts
    else
      @posts = Post.all
    end
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
