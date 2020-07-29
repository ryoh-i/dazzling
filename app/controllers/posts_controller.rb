# frozen_string_literal: true

class PostsController < ApplicationController

  #ユーザー一覧を取得(kaminariでページネーション機能を実装)
  def index
    @post = Post.all.page(params[:page]).per(6)
  end

  #ユーザー詳細情報を取得
  def show
    @post = Post.find_by(id: params[:id])
  end

  #ユーザーを作成
  def new
    @post = Post.new
  end

  #newアクションの後に実行される
  def create
    # find_or_create_by を使ってみる
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url, notice: "口コミを投稿しました"
    else
      flash[:notice] = '口コミの投稿に失敗しました'
      render :new
    end
  end

  #ユーザー情報を編集する
  def edit
  end

  private

  #送られてきたパラメーターを取得する
  #.permitメソッドで指定された以外のカラム情報をブロックする
  # user_idは紐付けを行っている
  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :content, :image, :review, :user_id)
  end
end
