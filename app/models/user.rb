class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy     # ユーザー/お気に入り → 1:多
  has_many :my_facilities, through: :favorites

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  #登録メソッド 
  def add_favorite(my_facility)
    favorites.find_or_create_by(my_facility_id: my_facility.id)
  end
  
  #登録解除メソッド
  def remove_favorite(my_facility)
    favorite = favorites.find_by(my_facility_id: my_facility.id)
    favorite.destroy if favorite
  end
  
  #確認メソッド
  def check_favorite?(my_facility)
    self.my_facilities.include?(my_facility)
  end
end