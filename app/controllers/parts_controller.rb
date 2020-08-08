class PartsController < ApplicationController
    def index
        @parts = Part.order(id: :desc).page(params[:page]).per(25)
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
          flash.now[:danger] = 'パートの登録に失敗しました。'
          render :new
        end
    end
    
    private
  
    def part_params
        params.require(:part).permit(:name)
    end
end
