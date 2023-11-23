module Types
  class BaseInputObject < GraphQL::Schema::InputObject
    include ApolloFederation::InputObject
    argument_class Types::BaseArgument
  end
end
