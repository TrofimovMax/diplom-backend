class AddForeignKeysToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, index: true, foreign_key: true
    add_reference :bookings, :gym, index: true, foreign_key: true
  end
end
