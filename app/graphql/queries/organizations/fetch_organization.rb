# frozen_string_literal: true

class FetchIntakeTag
end
module Queries
  module Organizations
    class FetchOrganization < GraphQL::Schema::Resolver
      type [Types::Models::OrganizationType], null: false

      argument :page, Integer, required: false
      argument :limit, Integer, required: false

      def resolve (page: nil, limit: nil)
        ::Organization.page(page).per(limit)
      end
    end
  end
end