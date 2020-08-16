class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
    
  def show
    unless current_user.part.present?
      redirect_to edit_user_path(current_user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :instrument, :birthday, :carrer, :message, :part_id, :image)
  end
  
end
