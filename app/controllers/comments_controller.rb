class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new params[:comment].permit(:content)
    @comment.post = @post
    if @comment.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

end
