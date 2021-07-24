class UsersController < ApplicationController
  #before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  #before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  #before_action :ensure_correct_user, {only: [:edit, :update]}
  def show
    @user = User.find_by(id: params[:id])
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      user_name: params[:user][:user_name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirm: params[:user][:password_confirm],
      user_image: "1.jpg"
    )
    if params[:user][:password] == params[:user][:password_confirm] && @user.save!
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  def edit
    #@user = User.find_by(id: params[:id])
    @user = @current_user
  end
  
  def update
    @user = @current_user
    @user.user_name = params[:user][:user_name]
    @user.intro = params[:user][:intro]
    #@current_user.user_name = params[:user_name]
    #@current_user.intro = params[:intro]
    if params[:user][:user_image]
      @current_user.user_image = "#{@current_user.id}.jpg"
      user_image = params[:user][:user_image]
      File.binwrite("public/images/user_images/#{@current_user.user_image}", image.read)
    end
    if @user.save!
      
      redirect_to("/users/#{@current_user.id}")
      flash[:notice] = "変更しました"
    else
      redirect_to("/users/#{@current_user.id}")
      #render("users/#{@current_user.id}/edit")
      flash[:notice] = "変更に失敗しました"
    end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/rentals/top")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    #@current_user = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/rentals/top")
  end
  
  #def ensure_correct_user
    #if @current_user.id != params[:id].to_i
     # flash[:notice] = "権限がありません"
      #redirect_to("/posts/index")
    #end
  #end
end

