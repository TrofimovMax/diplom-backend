module Mutations
  class CreateGymMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :title, String, required: true do
      description "title  must be String"
    end
    argument :address, String, required: true do
      description "address must be String"
    end

    field :gym, Types::Models::GymType, null:false

    def resolve(title:, address:)
      gym = Gym.create!(title:, address:)
      { gym: }
    end
  end
end
