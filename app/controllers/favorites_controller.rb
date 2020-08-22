# frozen_string_literal: true

class FavoritesController < ApplicationController
  # お気に入り
  # Favoriteモデルにuser_idとpost_idを格納
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.create(post_id: params[:post_id])
  end

  # お気に入り取り消し
  # Favoriteモデルのレコードを削除
  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
    @post = Post.find(params[:post_id])
  end
end

