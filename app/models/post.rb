# frozen_string_literal: true

class Post < ApplicationRecord
  #userとの紐付け
  belongs_to :user
  #イメージ画像アップロード機能
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {maximum: 15}
  validates :content, presence: true, length: {maximum: 160}
end
