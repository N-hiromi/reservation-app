class ReservationsController < ApplicationController
  def index
    @user = @current_user
    @reservations = @user.reservations.all
  end

  def confirm
    byebug
    @user = @current_user
		@reservation = @user.reservations.new(@attr)
		session[:reservation] = @reservation
		if @reservation.invalid?
			render :confirm
		end
	end
	
  def back
    @user = @current_user
    @reservation = @user.reservations.new(session[:reservation])
		session.delete(:reservation)
		render :show
  end
  
  
	
end
