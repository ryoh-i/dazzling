require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameが空だとエラー' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとエラー' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it '画像は空でも良い' do
      @user.image = '';
      expect(@user.valid?).to eq(true)
    end

    it 'プロフィールは空でも良い' do
      @user.profile = '';
      expect(@user.valid?).to eq(true)
    end

    it 'プロフィールは200文字より上だった場合エラー' do
      @user.profile =+ 'a' * 201
      expect(@user.valid?).to eq(false)
    end
  end
end