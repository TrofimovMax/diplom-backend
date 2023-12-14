# frozen_string_literal: true

module Types
  module Models
    class OrganizationType < Types::BaseObject
      key fields: [:id, :name]
      field :id, ID, null: false
      field :name, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
