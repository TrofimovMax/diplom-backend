module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :gyms, [Types::Models::GymType], null: false do
      description "Query that selects all gyms"
    end
    field :gymsId, Integer, null:false do
      description "Query that selects one gym"
    end

    field :bookings, [Types::Models::BookingType], null: false do
      description "Query that selects all bookings"
    end
    field :bookingByUserId, Types::Models::BookingType, null: true do
      description "Query that selects all bookings this user"
    end

    def bookings
      @bookings = Booking.all
    end
    def bookingByUserId(id)
      Booking.where(user_id: id)
    end

    def gyms
      Gym.all
    end
    def gymsId(id)
      Gym.find(id)
    end

  end
end
