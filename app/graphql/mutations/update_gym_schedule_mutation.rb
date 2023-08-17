module Mutations
  class UpdateGymScheduleMutation < BaseMutation
    field :gym, Types::Models::GymType, null: false

    argument :id, ID, required: true
    argument :schedule, Types::Inputs::Gym::GymScheduleInput, required: true

    def resolve(id:, schedule:)
      gym = Gym.find(id)
      updated_schedule = process_schedule(schedule)

      if gym.update(schedule: updated_schedule)
        { gym: gym }
      else
        raise GraphQL::ExecutionError, gym.errors.full_messages.join(", ")
      end
    end

    private
    def process_schedule(schedule_input)
      Biz::Schedule.new do |config|
        config.hours = {
          mon: schedule_input.mon,
          tue: schedule_input.tue,
          wed: schedule_input.wed,
          thu: schedule_input.thu,
          fri: schedule_input.fri,
          sat: schedule_input.sat,
          sun: schedule_input.sun
        }
      end
    end
  end
end
