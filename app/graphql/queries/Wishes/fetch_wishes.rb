# frozen_string_literal: true


module Queries
  module Wishes
    class FetchWishes < GraphQL::Schema::Resolver
      type [Types::Models::WishingType], null: false

      argument :page, Integer, required: false
      argument :limit, Integer, required: false

      def resolve (page: nil, limit: nil)
        ::Wishing.page(page).per(limit)
      end
    end
  end
end