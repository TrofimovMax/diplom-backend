# == Schema Information
#
# Table name: gyms
#
#  id         :bigint           not null, primary key
#  address    :string           not null
#  capacity   :integer
#  schedule   :jsonb
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
class Gym < ApplicationRecord


  belongs_to :owner, class_name: 'User', required: false
  has_many :bookings
  has_many :wishes
  # has one attachment :avatar
  # has many attachments :pictures

  validates :title,
            :address,
            presence: true

end
