class BookingsController < ApplicationController

  def index
    bookings = Booking.all
    render json: bookings
  end


  def create
    if current_user
      current_user_id = current_user.id
      booking = Booking.create({
                                 gym_id: params[:gym_id],
                                 user_id: current_user_id,
                                 start_at: params[:start_at],
                                 end_at: params[:end_at]
                               })
      render json: {
        status: 200,
        message: "booking was successfully on " + params[:start_at],
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
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
