# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favorited_postsによってユーザーがどの投稿をお気に入りしているかを取得することができる
  has_many :favorited_posts, through: :favorites, source: :post
  # following_relationshipsモデルを架空で作成しており、follower_idを参考にfollowing_relationshipsモデルにアクセスするようにしている
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  # ユーザーがその投稿をいいねしているかどうかを判定する
  def already_favorited?(post)
    favorites.exists?(post_id: post.id)
  end

  # フォローしているかを確認する
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  # フォローを実施する
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  # フォローを外す
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  # 絞り込み検索機能のメソッド(feature_add_serach_form#74)
  def self.search(search)
    if search
      # 値がsearchにあれば、nameを起点として結果を返す
      # .pageの前はwhereなどでつなぐ必要がある
      User.where(['name LIKE ?', "%#{search}%"])
    else
      # 値がserrchになければ何もしない
      User.where({})
    end
  end

  # Rspecテストのため、一時的に記載
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
end
