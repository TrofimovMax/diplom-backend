module Types
  class MutationType < Types::BaseObject
    field :create_booking_mutation, mutation: Mutations::CreateBookingMutation
    field :create_gym_mutation, mutation: Mutations::CreateGymMutation
  end
end
