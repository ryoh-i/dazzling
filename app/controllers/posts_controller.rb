# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    # find_or_create_by を使ってみる
    post = Post.new(post_params)
    post.save!
    # redirect_to post_url, notice: "口コミを投稿しました"
  end

  def edit; end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :review, :review)
  end
end
