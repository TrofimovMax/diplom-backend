# frozen_string_literal: true

module Types
  class BookingType < Types::BaseObject
    field :id, ID, null: false
    field :start_at, GraphQL::Types::ISO8601DateTime
    field :end_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer
    field :gym_id, Integer
  end
end
