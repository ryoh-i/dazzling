# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  # favorited_usersによって投稿がどのユーザーにお気に入りされているかを取得することができる
  has_many :favorited_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 160 }
end
