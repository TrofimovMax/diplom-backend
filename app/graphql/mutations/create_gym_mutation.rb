module Mutations
  class CreateGymMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :gym, Types::GymType, null:false
    # TODO: define arguments
    # argument :name, String, required: true
    argument :title, String, required: true do
      description "title  must be String"
    end
    argument :address, String, required: true do
      description "address must be String"
    end
    # TODO: define resolve method
    def resolve(title:, address:)
      @gym = Gym.new(title: title, address:address)
      if (@gym.save)
        {
          gym:@gym,
          errors: []
        } else {
        gym:nil,
        errors: @gym.errors.full_message
      }
      end
    end
  end
end
