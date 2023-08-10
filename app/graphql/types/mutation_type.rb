module Types
  class MutationType < Types::BaseObject
    field :update_gym_mutation, mutation: Mutations::UpdateGymMutation
    field :delete_gym, mutation: Mutations::DeleteGym
    field :create_booking_mutation, mutation: Mutations::CreateBookingMutation
    field :create_gym_mutation, mutation: Mutations::CreateGymMutation
  end
end
