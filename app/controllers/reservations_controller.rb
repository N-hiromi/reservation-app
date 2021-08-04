class ReservationsController < ApplicationController
	#require 'active_support'
	#require 'active_support/core_ext'
  def index
    @user = @current_user
    @rentals = @current_user.rentals.where.not(reservation_id: "")
    @reservations = @current_user.reservations.all
    #@reservations.blank?
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
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@reservation.total = @rental.price.to_i * ((@reservation.check_out - @reservation.check_in).to_i + 1)
		if @reservation.invalid?
			redirect_to "/rentals/#{params[:rental_id]}"
			#render "rentals/#{params[:rental_id]}"
		end
	end
	
  def back
    @user = @current_user
    @reservation = @user.reservations.new(session[:reservation])
		session.delete(:reservation)
		redirect_to "/rentals/#{params[:rental_id]}"
		
  end
  
  def complete
		@reservation = Reservation.create!(session[:reservation])
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@rental.reservation_id = @reservation.id
		@rental.save
		session.delete(:reservation)
		redirect_to "/rentals/#{params[:rental_id]}/reservations/#{@reservation.id}/show"
	end
	
	def show
		@reservation = Reservation.find_by(id: params[:id])
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@reservation.total = @rental.price.to_i * ((@reservation.check_out - @reservation.check_in).to_i + 1)
	end
end
