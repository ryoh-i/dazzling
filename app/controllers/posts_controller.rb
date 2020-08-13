# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    #　@posts = Post.all.page(params[:page]).per(10)
    # 上記では、検索機能で絞ることはできていないため、以下のようにpost.rbのsearchを使って絞る。
    @posts = Post.search(params[:search]).page(params[:page]).per(6)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @favorite = Favorite.new
  end

  def new
    @post = Post.new
  end

  def create
    # find_or_create_by を使ってみる
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url, notice: '口コミを投稿しました'
    else
      flash[:notice] = '口コミの投稿に失敗しました'
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '口コミ内容を編集しました'
    else
      render :edit, alert: '口コミ内容を編集できませんでした'
    end
  end

  def destroy
    @post = Post.find(id: params[:id])
    if @post.user_id == current_user.id
      if @post.destroy
        redirect_to posts_path, notice: '投稿を削除しました'
      else
        redirect_to posts_path, alert: '投稿が削除できませんでした'
      end
    end
  end

  private

  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :profile, :content, :image, :user_id, :rate)
  end
end
