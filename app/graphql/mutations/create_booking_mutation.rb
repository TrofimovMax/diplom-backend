module Mutations
  class CreateBookingMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :booking, Types::BookingType, null:false
    # TODO: define arguments
    # argument :name, String, required: true
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
    # TODO: define resolve method
    def resolve(start_at:, end_at:, gym_id:, user_id:)
      @booking = Booking.new(start_at:start_at,end_at:end_at, gym_id:gym_id, user_id:user_id)
      if @booking.save
        {
          booking:@booking,
          errors: []
        } else {
        booking: nil,
        errors: @booking.errors.full_messages
      }
      end
    end
  end
end
