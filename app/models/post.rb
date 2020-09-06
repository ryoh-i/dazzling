# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites

  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  # favorited_usersによって投稿がどのユーザーにお気に入りされているかを取得することができる
  has_many :favorited_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: { maximum: 160 }

  def self.search(search)
    if search
      # 値がsearchにあれば結果を返す
      # .pageの前はwhereなどでつなぐ必要がある
      Post.where(['content LIKE ?', "%#{search}%"])
    else
      # 値がserrchになければ何もしない
      Post.where({})
    end
  end
end
