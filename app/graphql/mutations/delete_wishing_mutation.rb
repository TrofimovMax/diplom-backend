module Mutations
  class DeleteWishingMutation < BaseMutation
    # Just returning id is okay
    field :id, ID, null: true
    field :wishing, Types::Models::WishingType, null:false

    argument :id, ID, required: true

    def resolve(id:)
      wishing = Wishing.find(id)
      # if booking.user != context[:current_user]
      #   raise GraphQL::ExecutionError, "You are not authorized!"
      # end
      if wishing.destroy
        {
          id: id,
          wishing: wishing,
        }
      else
        raise GraphQL::ExecutionError, wishing.errors.full_messages.join(", ")
      end
    end
  end
end
