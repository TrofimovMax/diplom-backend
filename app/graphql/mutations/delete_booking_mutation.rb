module Mutations
  class DeleteBookingMutation < BaseMutation
    # Just returning id is okay
    field :id, ID, null: true
    field :booking, Types::Models::BookingType, null:false

    argument :id, ID, required: true

    def resolve(id:)
      booking = Booking.find(id)
      # if booking.user != context[:current_user]
      #   raise GraphQL::ExecutionError, "You are not authorized!"
      # end
      if booking
        booking.destroy
      end
      {
        id: id,
        booking: booking,
      }
    end
  end
end
