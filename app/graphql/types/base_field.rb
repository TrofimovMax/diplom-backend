module Types
  class BaseField < GraphQL::Schema::Field
    include ApolloFederation::Field

    argument_class BaseArgument
  end
end
