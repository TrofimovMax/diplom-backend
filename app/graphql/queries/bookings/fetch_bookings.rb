# frozen_string_literal: true

module Queries
  module Bookings
    class FetchBookings < GraphQL::Schema::Resolver
      type [Types::Models::BookingType], null: false
      argument :page, Integer, required: false
      argument :limit, Integer, required: false

      def resolve (page: nil, limit: nil)
        ::Booking.page(page).per(limit)
      end
    end
  end
end