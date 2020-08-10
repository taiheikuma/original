class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(25)
    if logged_in?
      @post = current_user.posts.build
    end
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '連絡を投稿しました。'
      redirect_to posts_path
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '連絡の投稿に失敗しました。'
      redirect_to posts_path 
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      flash[:success] = '正常に更新されました'
      redirect_to posts_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def post_params
    params.require(:post).permit(:tittle, :content)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
