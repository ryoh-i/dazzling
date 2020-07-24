# frozen_string_literal: true

class PostsController < ApplicationController

  def index
    @post = Post.all.page(params[:page]).per(6)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

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

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :review)
  end
end
