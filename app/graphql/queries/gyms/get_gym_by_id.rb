# frozen_string_literal: true

module Queries
  module Gyms
    class GetGymById < GraphQL::Schema::Resolver
      description 'Find Gym by ID.'

      argument :id, ID, required: true

      type Types::Models::GymType, null: true

      def resolve(id:)
        if Gym.find(id)
          Gym.find(id)
        else
          raise GraphQL::ExecutionError, gym.errors.full_messages.join(", ")
        end
      end

    end
  end
end
