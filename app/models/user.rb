# frozen_string_literal: true

class User < ApplicationRecord
  #ユーザーが削除されたら、投稿も全て削除されるよう設定
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  mount_uploader :image, ImageUploader
end
