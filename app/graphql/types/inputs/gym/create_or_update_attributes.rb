# frozen_string_literal: true

module Types
  module Inputs
    module Gym
      class CreateOrUpdateAttributes < Types::BaseInputObject
        description "Attributes for creating or updating a blog post"
        argument :title, String, "Name for gym", required: true
        argument :address, String, "Placement where gym is.", required: true
        argument :capacity, Integer, "Max value for booking.", required: false
        argument :owner_id, ID, "Id user owned this gym", required: false
        argument :schedule, GraphQL::Types::JSON, "times for work gym", required: false
      end
    end
  end
end

