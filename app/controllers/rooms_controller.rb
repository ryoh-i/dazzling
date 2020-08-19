class RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    # form_forで格納されたパラメータを受け取りCreate
    @room = Room.create
    # ログインユーザーの@room_idとuseridをEntryテーブルに保存
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    # フォロしている相手側の相手側の@room_idとuseridをEntryテーブルに保存
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    # チャットルームへリダイレクトして会話開始
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    # Entryテーブルに@room_idとuseridが存在しているかを確認
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
