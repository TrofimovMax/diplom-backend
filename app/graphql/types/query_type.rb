module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :fetch_gyms, resolver: Queries::Gyms::FetchGyms, null: false
    field :get_gym_by_id, resolver: Queries::Gyms::GetGymById, null: true

    field :fetch_bookings, resolver: Queries::Bookings::FetchBookings, null: false
    field :get_booking_by_gym_id, resolver: Queries::Bookings::GetBookingByGymId, null: true


  end
end
