# frozen_string_literal: true

module Types
  module Inputs
    module Booking
      class BookingAttributes < Types::BaseInputObject
        description "Attributes for creating or updating a booking"
        argument :start_at, GraphQL::Types::ISO8601DateTime, "Time to start a class", required: true
        argument :end_at, GraphQL::Types::ISO8601DateTime, "Time to end a class", required: true
        argument :user_id, ID, "id user booked a place", required: true
        argument :gym_id, ID, "id gym where will be class", required: true
      end
    end
  end
end

