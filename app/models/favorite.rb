class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :my_facility
  validates_uniqueness_of :my_facility_id, scope: :user_id    # バリデーション（ユーザーと記事の組み合わせは一意）,同じ施設を複数回お気に入り登録させないため。
end
