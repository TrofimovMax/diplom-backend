class Gym < ApplicationRecord


  belongs_to :owner, class_name: 'User'

  # has one attachment :avatar
  # has many attachments :pictures

  validates :title,
            :address,
            presence: true

end
