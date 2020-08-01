class FavoritesController < ApplicationController

  # お気に入り
  # Favoriteモデルにuser_idとpost_idを格納
  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
  end

  # お気に入り取り消し
  # Favoriteモデルのレコードを削除
  def destroy
    @favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    @favorite.destroy
  end

end
