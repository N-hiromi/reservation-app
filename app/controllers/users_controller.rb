class UsersController < ApplicationController
  before_action :set_current_user
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user= User.find(params[:id])
  end
  def update
    @user= User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(id: @user.id)
      flash[:notice] = "アカウント情報を更新しました"
    else
      render action: :edit
      flash[:notice] = "変更に失敗しました"
    end
  end
  
  def user_params
  	params.permit(:user_name, :email, :password, :password_confirm, :image, :intro, :id)
  end
end
