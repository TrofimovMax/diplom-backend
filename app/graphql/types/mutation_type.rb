module Types
  class MutationType < Types::BaseObject
    field :create_booking_mutation, mutation: Mutations::CreateBookingMutation
    field :create_gym_mutation, mutation: Mutations::CreateGymMutation
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
