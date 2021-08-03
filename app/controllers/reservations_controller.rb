class ReservationsController < ApplicationController
	require 'active_support'
	require 'active_support/core_ext'
  def index
    @user = @current_user
    @rentals = @current_user.rentals.where.not(reservation_id: "")
    @reservations = @current_user.reservations.all
    @reservations.blank?
  end

  def confirm
    @user = @current_user
		@reservation = @user.reservations.new(
			check_in: params[:reservation][:check_in],
			check_out: params[:reservation][:check_out],
			num_people: params[:reservation][:num_people],
			rental_id: params[:rental_id]
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
		@reservation = Reservation.create!(session[:reservation])
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@rental.reservation_id = @reservation.id
		@rental.save
		session.delete(:reservation)
		redirect_to reservations_path
	end
	
	def show
		@reservation = Reservation.find_by(id: params[:id])
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@reservation.total = @reservation.price * (@reservation.check_out - @reservation.check_in + 1)
	end
end
