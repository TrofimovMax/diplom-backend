module Mutations
  class UpdateGymMutation < BaseMutation
    field :gym, Types::Models::GymType, null: false

    argument :id, ID, required: true
    argument :attributes, Types::Inputs::Gym::CreateOrUpdateAttributes, required: true

    def resolve(id:, attributes:)
      gym = Gym.find(id)
      if gym.update(attributes.to_h)
        { gym: gym }
      else
        raise GraphQL::ExecutionError, gym.errors.full_messages.join(", ")
      end
    end
  end
end
