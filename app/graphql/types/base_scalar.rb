module Types
  class BaseScalar < GraphQL::Schema::Scalar
    include ApolloFederation::Scalar
  end
end
