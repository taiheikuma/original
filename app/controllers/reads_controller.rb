class ReadsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.read(post)
    flash[:success] = '読みました。'
    redirect_to user_path(current_user)
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unread(post)
    flash[:success] = 'まだ読んでいません。'
    redirect_to user_path(current_user)
  end
end
