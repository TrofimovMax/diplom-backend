class BookingsController < ApplicationController

  def index
    bookings = Booking.all
    render json: bookings
  end


  def create
    current_user_id = current_user.id
    booking = Booking.create({
                 gym_id: params[:gym_id],
                 user_id: current_user_id,
                 start_at: params[:start_at],
                 end_at: params[:end_at]
               })
    render json: booking
  end

  def update
    id = params[:id]
    booking = Booking.find(id)
    booking.update(
      {
        start_at: params[:start_at],
        end_at: params[:end_at]
      }
    )
    render json: booking
  end
  def destroy
    id = params[:id]
    booking = Booking.find(id)
    booking.destroy
    render json: booking
  end

end
