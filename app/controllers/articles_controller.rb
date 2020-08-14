class ArticlesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
   
  def index
    @articles = Article.order(id: :desc).page(params[:page]).per(9)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = '記事を投稿しました。'
      redirect_to articles_path
    else
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = '正常に更新されました'
      redirect_to article_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = '記事を削除しました。'
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
