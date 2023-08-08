# frozen_string_literal: true

module Types
  module Models
    class BookingType < Types::BaseObject
      field :id, ID, null: false
      field :start_at, GraphQL::Types::ISO8601DateTime
      field :end_at, GraphQL::Types::ISO8601DateTime
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :user_id, ID
      field :user, Types::Models::UserType
      field :gym_id, ID
      field :gym, Types::Models::GymType
    end
  end
end
