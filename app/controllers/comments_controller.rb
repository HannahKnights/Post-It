class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new params[:comment].permit(:content)
    @comment.post = @post
    @comment.save ? redirect_to(posts_path) : render('new') 
  end

end
