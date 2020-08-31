# frozen_string_literal: true

class PostsController < ApplicationController
  # 投稿一覧のアクション
  def index
    # 　@posts = Post.all.page(params[:page]).per(10)
    # 上記では、検索機能で絞ることはできていないため、以下のようにpost.rbのsearchを使って絞る。
    @posts = Post.search(params[:search]).page(params[:page]).per(6)
  end

  # 投稿詳細ページのアクション
  def show
    @post = Post.find_by(id: params[:id])
    @favorite = Favorite.new
    @comment = Comment.new
    @comments = @post.comments
  end

  # 投稿新規ページのアクション
  def new
    @post = Post.new
    # @post = Review.new
    # @post.build_spot
  end

  # 投稿更新ページのアクション
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

  # 投稿編集ページのアクション
  def edit
    @post = Post.find_by(id: params[:id])
  end

  # 投稿編集ページのアクション
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '口コミ内容を編集しました'
    else
      render :edit, alert: '口コミ内容を編集できませんでした'
    end
  end

  # 投稿削除のアクション
  def destroy
    @post = Post.find_by(id: params[:id])
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
    params.require(:post).permit(:title, :profile, :content, :image, :user_id, :rate, :text, spot_attributes: [:address])
  end
end
