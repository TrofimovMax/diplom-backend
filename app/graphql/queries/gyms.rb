module Queries
  class Gyms

    field :gym, Types::GymType, null:false

    def resolve(title:, address:)
      gym = Gym.create!(title:, address:)
      { gym: }
    end
  end
end
