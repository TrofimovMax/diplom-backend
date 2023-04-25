class AddForeignKeysToWishes < ActiveRecord::Migration[7.0]
  def change
    add_reference :wishings, :user, index: true, foreign_key: true
    add_reference :wishings, :gym, index: true, foreign_key: true
  end
end
