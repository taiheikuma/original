class PartsController < ApplicationController
    before_action :require_user_logged_in
    
    def index
        @parts = Part.order(:id)
    end
    
    def show
        @users = User.where(part_id: params[:id]).page(params[:page]).per(25)
    end
    
    def new
        @part = Part.new
    end
    
    def create
        @part = Part.new(part_params)

        if @part.save
          flash[:success] = 'パートを登録しました。'
          redirect_to parts_path
        else
          flash.now[:danger] = 'パートを登録できません。'
          render :new
        end
    end
    
    def edit
        @part = Part.find(params[:id])
    end

    def update
        @part = Part.find(params[:id])
        if @part.update(part_params)
          flash[:success] = '更新されました。'
          redirect_to parts_path
        else
          flash.now[:danger] = '更新されませんでした。'
          render :edit
        end
    end
    
    def destroy
        @part = Part.find(params[:id])
        @part.destroy
        flash[:success] = '削除しました。'
        redirect_to parts_path
    end
    
    private
  
    def part_params
        params.require(:part).permit(:name, :image)
    end
end
