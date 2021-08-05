class UsersController < ApplicationController
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
      user_image: "default.jpg"
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
  end
  
  def update
    @current_user.user_name = params[:user][:user_name]
    @current_user.intro = params[:user][:intro]
    if params[:user][:user_image]
      @current_user.user_image = "#{@current_user.id}.jpg"
      image = params[:user][:user_image]
      File.binwrite("/home/ec2-user/environment/subako/public/images/user_images/#{@current_user.user_image}", image.read)
    end
    if @current_user.save!
      redirect_to("/users/#{@current_user.id}")
      flash[:notice] = "変更しました"
    else
      redirect_to("/users/#{@current_user.id}")
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
    flash[:notice] = "ログアウトしました"
    redirect_to("/rentals/top")
  end
end
