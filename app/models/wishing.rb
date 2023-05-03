# == Schema Information
#
# Table name: wishings
#
#  id         :bigint           not null, primary key
#  end_at     :datetime
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gym_id     :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_wishings_on_gym_id   (gym_id)
#  index_wishings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (gym_id => gyms.id)
#  fk_rails_...  (user_id => users.id)
#
class Wishing < ApplicationRecord
  belongs_to :user
  belongs_to :gym
end