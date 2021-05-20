class MyFacility < ApplicationRecord
  mount_uploader :top_image, TopImageUploader
  has_many :reviews, dependent: :destroy
  belongs_to :facility
  has_many :favorites, foreign_key: 'my_facility_id', dependent: :destroy     # 記事/お気に入り → 1:多
  belongs_to :user, optional: true
  has_many :users, through: :favorites
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
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
