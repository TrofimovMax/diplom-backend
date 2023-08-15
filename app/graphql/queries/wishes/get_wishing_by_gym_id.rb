# frozen_string_literal: true


module Queries
  module Wishes
    class GetWishingByGymId < GraphQL::Schema::Resolver
      description 'Find wishes by gym_id.'

      argument :gym_id, ID, required: true

      type [Types::Models::WishingType], null: true

      def resolve(gym_id: )
        ::Wishing.where(gym_id: gym_id)
      end
    end
  end
end