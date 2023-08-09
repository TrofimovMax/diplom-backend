# frozen_string_literal: true

module Queries
  module Bookings
    class GetBookingByGymId < GraphQL::Schema::Resolver
      description 'Find Booking by ID.'

      argument :gym_id, ID, required: true

      type Types::Models::BookingType, null: true

      def resolve(gym_id: )
        ::Booking.find(gym_id)
      end
    end
  end
end