class CreateMyFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :my_facilities do |t|
      t.string :facility_name
      t.string :branch_name
      t.string :kana
      t.string :category
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :services
      t.string :top_image
      t.string :other_image
      t.string :opening_days
      t.string :opening_hours
      t.string :access
      t.integer :parking_lot
      t.integer :seats
      t.text :details
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
