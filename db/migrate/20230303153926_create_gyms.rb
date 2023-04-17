class CreateGyms < ActiveRecord::Migration[7.0]
  def change
    create_table :gyms do |t|
      t.string :title, null: false
      t.string :address, null: false
      t.jsonb :schedule
      t.integer :capacity

      t.timestamps
    end
  end
end
