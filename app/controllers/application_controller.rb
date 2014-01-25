class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_new_post, :show_all_tags

  private

  def set_new_post
    @new_post = Post.new
  end

  def show_all_tags
    @all_tags = Tag.all
  end

end
