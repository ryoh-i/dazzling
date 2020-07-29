# frozen_string_literal: true

class User < ApplicationRecord
  #ユーザーが削除されたら、投稿も全て削除されるよう設定
  has_many :posts, dependent: :destroy
  #deviseはデフォルト機能を利用している↓
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アイコン画像アップロード機能
  mount_uploader :image, ImageUploader
end
