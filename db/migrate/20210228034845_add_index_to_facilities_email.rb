class AddIndexToFacilitiesEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :facilities, :email, unique: true
  end
end
