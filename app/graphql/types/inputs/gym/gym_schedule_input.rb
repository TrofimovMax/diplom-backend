# frozen_string_literal: true

module Types
  module Inputs
    module Gym
      class GymScheduleInput < BaseInputObject
        argument :mon, GraphQL::Types::JSON, required: true
        argument :tue, GraphQL::Types::JSON, required: true
        argument :wed, GraphQL::Types::JSON, required: true
        argument :thu, GraphQL::Types::JSON, required: true
        argument :fri, GraphQL::Types::JSON, required: true
        argument :sat, GraphQL::Types::JSON, required: true
        argument :sun, GraphQL::Types::JSON, required: true
      end
    end
  end
end

