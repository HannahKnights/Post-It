class CommentsController < ApplicationController

  def new
    @post_for_comment = Post.find(params[:post_id])
    @new_comment = Comment.new
  end

  def create
    @post_for_comment = Post.find(params[:post_id])
    @new_comment = Comment.new params[:comment].permit(:content)
    @new_comment.post = @post_for_comment
    @new_comment.save ? redirect_to(posts_path) : render('new') 
  end

end
