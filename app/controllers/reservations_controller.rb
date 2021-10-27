class ReservationsController < ApplicationController
  def index
    #@rentals = @current_user.rentals.where.not(reservation_id: "")
    @reservations = @current_user.reservations.all
  end

  def confirm
		@reservation = @current_user.reservations.new(reservation_params)
		session[:reservation] = @reservation 
		@rental = Rental.find(params[:rental_id])
		@reservation.total = @reservation.num_people.to_i * @rental.price.to_i * (@reservation.check_out - @reservation.check_in + 1).to_i
		if @reservation.invalid?
			redirect_to rental_path(id: params[:rental_id])
		end
	end
	
  def back
    @reservation = @current_user.reservations.new(session[:reservation])
		session.delete(:reservation)
		redirect_to "/rentals/#{params[:rental_id]}"
  end
  
  def complete
		@reservation = Reservation.create!(session[:reservation])
		@rental = Rental.find(params[:rental_id])
		@reservation.save!
		session.delete(:reservation)
		redirect_to reservation_path(id: @reservation.id)
	end
	
	def show
		@reservation = Reservation.find(params[:id])
		@rental = Rental.find(@reservation.rental_id)
	end

	private
  def reservation_params
  	params.require(:reservation).permit(:check_in, :check_out, :num_people, :rental_id, :image)
  end
end
