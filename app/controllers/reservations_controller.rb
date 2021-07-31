class ReservationsController < ApplicationController
  def index
    @user = @current_user
    @reservations = @user.reservations.all
    byebug
    if @reservations
    	puts "test"
    end
  end

  def confirm
    @user = @current_user
		@reservation = @user.reservations.new(
			check_in: params[:reservation][:check_in],
			check_out: params[:reservation][:check_out],
			num_people: params[:reservation][:num_people]
			)
		session[:reservation] = @reservation
		if @reservation.invalid?
			render :show
		end
	end
	
  def back
    @user = @current_user
    @reservation = @user.reservations.new(session[:reservation])
		session.delete(:reservation)
		render :show
  end
  
  def complete
		Reservation.create!(session[:reservation])
		session.delete(:reservation)
		redirect_to reservations_path
	end
	
end
