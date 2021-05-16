class Review < ApplicationRecord
  belongs_to :user
  belongs_to :my_facility
  validates :score, presence: true
end
