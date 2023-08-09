# frozen_string_literal: true

module Queries
  module Gyms
    class FetchGyms < GraphQL::Schema::Resolver
      type [Types::Models::GymType], null: false
      argument :page, Integer, required: false
      argument :limit, Integer, required: false

      def resolve (page: nil, limit: nil)
        ::Gym.page(page).per(limit)
      end
    end
  end
end

