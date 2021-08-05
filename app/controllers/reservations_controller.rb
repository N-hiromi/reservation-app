class ReservationsController < ApplicationController
  def index
    @rentals = @current_user.rentals.where.not(reservation_id: "")
    @reservations = @current_user.reservations.all
  end

  def confirm
		@reservation = @current_user.reservations.new(
			check_in: params[:reservation][:check_in],
			check_out: params[:reservation][:check_out],
			num_people: params[:reservation][:num_people],
			rental_id: params[:rental_id]
			)
		session[:reservation] = @reservation 
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@reservation.total = @reservation.num_people.to_i * @rental.price.to_i * (@reservation.check_out - @reservation.check_in).to_i
		if @reservation.invalid?
			redirect_to "/rentals/#{params[:rental_id]}"
		end
	end
	
  def back
    @reservation = @current_user.reservations.new(session[:reservation])
		session.delete(:reservation)
		redirect_to "/rentals/#{params[:rental_id]}"
  end
  
  def complete
		@reservation = Reservation.create!(session[:reservation])
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@reservation.room_image = @rental.room_image
		@reservation.room = @rental.room
		@reservation.description = @rental.description
		@reservation.rental_id = @rental.id
		@reservation.save!
		session.delete(:reservation)
		redirect_to "/rentals/#{params[:rental_id]}/reservations/#{@reservation.id}/show"
	end
	
	def show
		@reservation = Reservation.find_by(id: params[:id])
		@rental = @current_user.rentals.find_by(id: params[:rental_id])
		@reservation.total = @rental.price.to_i * ((@reservation.check_out - @reservation.check_in).to_i + 1)
	end
end
