class SchdulesController < ApplicationController
   before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @schdule = Schdule.new
  end

  def create
    @schdule = current_user.schdules.build(schdule_params)
    if @schdule.save
      flash[:success] = '予定を投稿しました。'
      redirect_to root_url(anchor: 'schdules')
    else
      flash.now[:danger] = '予定の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @schdule = Schdule.find(params[:id])
  end

  def update
    @schdule = Schdule.find(params[:id])
    if @schdule.update(schdule_params)
      flash[:success] = '更新されました'
      redirect_to root_url(anchor: 'schdules')
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @schdule = Schdule.find(params[:id])
    @schdule.destroy
    flash[:success] = '予定を削除しました。'
    redirect_to root_url(anchor: 'schdules')
  end

  private

  def schdule_params
    params.require(:schdule).permit(:day, :content, :place)
  end
end
