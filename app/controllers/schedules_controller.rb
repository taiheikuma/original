class SchedulesController < ApplicationController
   before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = '予定を投稿しました。'
      redirect_to root_url(anchor: 'schedules')
    else
      flash.now[:danger] = '予定の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = '更新されました'
      redirect_to root_url(anchor: 'schedules')
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:success] = '予定を削除しました。'
    redirect_to root_url(anchor: 'schedules')
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :content, :place)
  end
end
