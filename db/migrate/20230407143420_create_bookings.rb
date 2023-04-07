class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
