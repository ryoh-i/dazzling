# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 160 }
end
