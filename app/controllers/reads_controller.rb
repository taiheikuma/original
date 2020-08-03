class ReadsController < ApplicationController
  def create
    user = User.find(params[:post_id])
    current_user.read(post)
    flash[:success] = '読みました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:post_id])
    current_user.unread(user)
    flash[:success] = 'まだ読んでいません。'
    redirect_to user
  end
end
