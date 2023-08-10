module Mutations
  class UpdateBookingMutation < BaseMutation
    field :booking, Types::Models::BookingType, null: false

    argument :id, ID, required: true
    argument :attributes, Types::Inputs::Booking::BookingAttributes, required: true

    def resolve(id:, attributes:)
      booking = Booking.find(id)
      if booking.update(attributes.to_h)
        { booking: booking }
      else
        raise GraphQL::ExecutionError, booking.errors.full_messages.join(", ")
      end
    end
  end
end
