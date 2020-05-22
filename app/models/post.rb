# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :store_name, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :address_prefectures, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode

  enum address_prefectures: {
    "---": 0,
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
    沖縄県: 47
  }

  scope :get_by_address_prefectures, lambda { |address_prefectures|
                                       where(address_prefectures: address_prefectures)
                                     }

  ransacker :likes_count do
    query = '(SELECT COUNT(likes.post_id) FROM likes where likes.post_id = posts.id GROUP BY likes.post_id)'
    Arel.sql(query)
  end

  ransacker :prefectures_group do
    query = '(SELECT address_prefectures FROM posts GROUP BY address_prefectures)'
    Arel.sql(query)
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  end
