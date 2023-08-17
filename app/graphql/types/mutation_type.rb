module Types
  class MutationType < Types::BaseObject
    field :update_gym_schedule_mutation, mutation: Mutations::UpdateGymScheduleMutation
    field :update_wishing_mutation, mutation: Mutations::UpdateWishingMutation
    field :delete_wishing_mutation, mutation: Mutations::DeleteWishingMutation
    field :create_wishing_mutation, mutation: Mutations::CreateWishingMutation
    field :update_booking_mutation, mutation: Mutations::UpdateBookingMutation
    field :delete_booking_mutation, mutation: Mutations::DeleteBookingMutation
    field :update_gym_mutation, mutation: Mutations::UpdateGymMutation
    field :delete_gym, mutation: Mutations::DeleteGym
    field :create_booking_mutation, mutation: Mutations::CreateBookingMutation
    field :create_gym_mutation, mutation: Mutations::CreateGymMutation
  end
end
