# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favorited_postsによってユーザーがどの投稿をお気に入りしているかを取得することができる
  has_many :favorited_posts, through: :favorites, source: :post
  mount_uploader :image, ImageUploader

  #ユーザーがその投稿をいいねしているかどうかを判定する
  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end

end
