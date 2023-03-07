# == Schema Information
#
# Table name: gyms
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint
#
# Indexes
#
#  index_gyms_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require "test_helper"

class GymTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
