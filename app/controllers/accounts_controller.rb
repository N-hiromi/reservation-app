class AccountsController < ApplicationController
  def show
  end

  def edit
  end

  def update
    @current_user.email = params[:email]
    @current_user.password = params[:password]
    @current_user.password_confirm = params[:password_confirm]
    if params[:password] == params[:password_confirm]
      redirect_to("/accounts/show")
      flash[:notice] = "アカウント情報を更新しました"
    else
      flash[:notice] = "同じパスワードを２回入力してください"
      render("accounts/#{@current_user.id}/edit")
    end
  end
end
