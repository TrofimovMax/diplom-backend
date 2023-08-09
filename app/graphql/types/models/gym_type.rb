# frozen_string_literal: true

module Types
  module Models
    class GymType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :address, String, null: false
      field :schedule, GraphQL::Types::JSON
      field :capacity, Integer
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :owner_id, ID
      field :owner, Types::Models::UserType
    end
  end
end
