class RentalsController < ApplicationController
  before_action :search
  before_action :set_current_user
  def top
  end

  def index
    @count= @rentals.count
  end

  def show
    @rental = Rental.find_by(id: params[:id])
    session.delete(:reservation)
    @reservation = Reservation.new
  end
	
  def new
    @rental = @current_user.rentals.new
  end
  
  def create
    @rental = @current_user.rentals.new(rental_params)
    if @rental.save
      flash[:notice] = "お部屋を登録しました"
      redirect_to("/rentals/#{@current_user.id}/entry")
    else
      flash[:notice] = "登録失敗"
      render action: :new
    end
  end
  
  def edit
    @rental = @current_user.rentals.find(params[:user][:user_id])
  end
  
  def update
    @rental = @current_user.rentals.find(params[:user][:user_id])
    if @rental.update(rental_params)
      redirect_to rental_path(id: @rental.id)
      flash[:notice] = "情報を更新しました"
    else
      flash[:notice] = "登録に失敗しました"
      render  action: :edit
    end
  end

  def destroy
    if @current_user.rentals.find(params[:rental][:id]).destroy!
      flash[:notice] = "お部屋を削除しました"
      redirect_to("/rentals/#{@current_user.id}/entry")
    else
      flash[:notice] = "失敗"
      redirect_to("/rentals/#{@current_user.id}/entry")
    end
  end
  
  def entry
    @rentals = @current_user.rentals.all
  end

  private
  def rental_params
    params.require(:rental).permit(:room, :description, :price, :area, :address, :image).merge(owner_id: @current_user.id)
  end
end

