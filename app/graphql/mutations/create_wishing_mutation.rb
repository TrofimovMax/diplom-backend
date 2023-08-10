module Mutations
  class CreateWishingMutation < BaseMutation
    field :wishing, Types::Models::WishingType, null: false

    argument :attributes, Types::Inputs::Wishing::WishingAttributes, required: true

    def resolve(attributes:)
      wishing = Wishing.create!(attributes.to_h)
      if wishing
      { wishing: }
      else
        raise GraphQL::ExecutionError, wishing.errors.full_messages.join(", ")
      end
    end
  end
end
