class MyFacility < ApplicationRecord
  mount_uploader :top_image, ImageUploader
  belongs_to :facility
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
  validates :facility_name
  validates :kana
  validates :category
  validates :address
  validates :top_image
   with_options uniqueness: true do
     validates :phone_number
     validates :email
   end
  end
end
