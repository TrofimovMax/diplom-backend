# frozen_string_literal: true

module Queries
  module Gyms
    class GetGymById < GraphQL::Schema::Resolver
      description 'Find Gym by ID.'

      argument :id, ID, required: true

      type Types::Models::GymType, null: true

      def resolve(id:)
        ::Gym.find(id)
      end
    end
  end
end
