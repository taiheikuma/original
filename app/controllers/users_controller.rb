class UsersController < ApplicationController
  def index
    #postの内容を最新順で表示
    @posts = Post.order(id: :desc).page(params[:page]).per(25)
  end
    
  def show
  end

  def new
    @user = user.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
