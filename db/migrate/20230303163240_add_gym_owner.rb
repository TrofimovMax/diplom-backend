class AddGymOwner < ActiveRecord::Migration[7.0]
  def change
    add_reference :gyms, :owner, foreign_key: { to_table: :users }
  end
end
