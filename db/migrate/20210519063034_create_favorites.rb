class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :my_facility, null: false, foreign_key: true
      t.timestamps
      t.index [:user_id, :my_facility_id], unique: true
    end
  end
end
