class BookingsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def index
    bookings = Booking.where(gym_id: params[:gym_id]).all
    # bookings = Booking.where(gym_id: params[:gym_id], start_at: params[:start]..params[:end]).all
    render json: bookings
  end

  def current_bookings
    count = Booking.where(gym_id: params[:gym_id], start_at: params[:start_at]).count
    render json: {
      current_bookings: count,
    }
  end
  def create
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
      booking: booking,
    }, status: :ok
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
