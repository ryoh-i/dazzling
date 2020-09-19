# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.search(params[:search]).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    # 「チャットへ」を押したユーザーとホストユーザーをwhereで探してEntriesテーブルに記録する
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    # ログインユーザーでなければ、true
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          # roomが作成されていれば、true
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit; end

  def update; end

  def destroy; end

  def following
    # @userがフォローしているユーザー
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    # @userをフォローしているユーザー
    @user = User.find(params[:id])
    @users = @user.followers
    # render 'show_follower'
  end
end
