module Mutations
  class UpdateWishingMutation < BaseMutation
    field :wishing, Types::Models::WishingType, null: false

    argument :id, ID, required: true
    argument :attributes, Types::Inputs::Wishing::WishingAttributes, required: true

    def resolve(id:, attributes:)
      wishing = Wishing.find(id)
      if wishing.update(attributes.to_h)
        { wishing: wishing }
      else
        raise GraphQL::ExecutionError, wishing.errors.full_messages.join(", ")
      end
    end
  end
end
