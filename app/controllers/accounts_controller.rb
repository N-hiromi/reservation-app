class AccountsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user= User.new(account_params)
    @user.image.attach(io: File.open("app/assets/images/no_image.png"), filename: "no_image.png")
    if params[:password] == params[:password_confirm] && @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to user_path(id: @user.id)
    else
      flash[:notice] = "登録に失敗しました"
      render action: :new
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to rentals_top_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("accounts/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to rentals_top_path
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to rentals_top_path
    flash[:notice] = "退会しました"
  end

  private
  def account_params
    params.permit(:email, :password, :password_confirm)
  end
end