class ReadsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    post = Post.find(params[:post_id])
    current_user.read(post)
    flash[:success] = '確認しました。'
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unread(post)
    flash[:success] = '確認していません。'
    redirect_to posts_path
  end
end
