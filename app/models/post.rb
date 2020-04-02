# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :store_name, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :time_start, presence: true
  validates :time_end, presence: true
  # validates :environment, presence: true
  # validates :evaluation, presence: true
  mount_uploader :image, ImageUploader
end
