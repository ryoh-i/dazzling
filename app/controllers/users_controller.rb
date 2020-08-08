# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def update; end

  def destroy; end

  def follows
    # @userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    # render 'show_follow'
  end

  def followers
    # @userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    # render 'show_follower'
  end
end
