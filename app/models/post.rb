class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :store_name, presence: true
  validates :address, presence: true
  mount_uploader :image, ImageUploader
end
