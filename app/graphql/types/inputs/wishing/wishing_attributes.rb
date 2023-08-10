# frozen_string_literal: true


module Types
  module Inputs
    module Wishing
      class WishingAttributes < Types::BaseInputObject
        description "Attributes for creating or updating a wishing"
        argument :start_at, GraphQL::Types::ISO8601DateTime, "Time to wish start a class", required: true
        argument :end_at, GraphQL::Types::ISO8601DateTime, "Time to wish end a class", required: true
        argument :user_id, ID, "id user wish a place", required: true
        argument :gym_id, ID, "id gym where will want be class", required: true
      end
    end
  end
end