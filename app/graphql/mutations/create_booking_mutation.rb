module Mutations
  class CreateBookingMutation < BaseMutation

    argument :start_at, GraphQL::Types::ISO8601DateTime, required: true do
      description "start class time only datetime"
    end
    argument :end_at, GraphQL::Types::ISO8601DateTime, required: true do
      description "end class time only datetime"
    end
    argument :gym_id, Integer, required: true do
      description "number id gym"
    end
    argument :user_id, Integer, required: true do
      description "number id user"
    end

    field :booking, Types::Models::BookingType, null: false

    def resolve(start_at:, end_at:, gym_id:, user_id:)
      booking = Booking.create!(start_at:, end_at:, gym_id:, user_id:)
      { booking: }
    end
  end
end
