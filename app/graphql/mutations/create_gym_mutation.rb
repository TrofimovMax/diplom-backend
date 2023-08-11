module Mutations
  class CreateGymMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :attributes, Types::Inputs::Gym::GymAttributes, required: true

    field :gym, Types::Models::GymType, null:false

    def resolve(attributes:)
      gym = Gym.create!(attributes.to_h)
      if gym
        { gym: gym}
      else
        raise GraphQL::ExecutionError, gym.errors.full_messages.join(", ")
      end
    end
  end
end
