class Photo < ActiveRecord::Base
  mount_uploader :image, TopImageUploader
end