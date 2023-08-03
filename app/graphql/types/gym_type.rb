# frozen_string_literal: true

module Types
  class GymType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :address, String, null: false
    field :schedule, GraphQL::Types::JSON
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :owner_id, Integer
  end
end
