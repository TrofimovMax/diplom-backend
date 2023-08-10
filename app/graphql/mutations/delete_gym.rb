module Mutations
  class DeleteGym < BaseMutation
    argument :id , ID, required: true do
      description "ID must be unique bigint"
    end

    # Just returning id is okay
    field :id, ID, null: true
    field :gym, Types::Models::GymType, null:false

    def resolve(id:)
      gym = Gym.find(id)
      # if gym.user != context[:current_user]
      #   raise GraphQL::ExecutionError, "You are not authorized!"
      # end
      gym.destroy
      {
        id: id,
      }
    end
  end
end
