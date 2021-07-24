class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :user_params
    before_action :search
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/rentals/index")
    end
  end
  
  def search
    @q = Rental.ransack(params[:q])
    @rentals = @q.result(distinct: true)
  end
  
  def user_params
    @user = User.find_by(id: params[:id])
  end
end
