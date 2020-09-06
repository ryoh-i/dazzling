require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe '存在性のテスト' do
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
      @user.profile = +'a' * 201
      expect(@user.valid?).to eq(false)
    end
  end

  describe '文字数のテスト' do
    it 'nameが10文字以上だとエラー' do
      @user.name = 'a' * 11
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが6文字以下だとエラー' do
      @user.password = 'a' * 5
      expect(@user.valid?).to eq(false)
    end

    it 'password_confirmationが6文字以下だとエラー' do
      @user.password = 'a' * 5
      expect(@user).to_not eq(false)
    end
  end

  describe '一意性のテスト' do
    it 'nameが一意ではないとエラー' do
      create(:user, name: 'TestUser')
      user2 = build(:user, name: 'TestUser')
      expect(user2).to_not eq(false)
    end

    it 'emailが一意でないと無効' do
      create(:user, email: 'test@example.com')
      user2 = build(:user, email: 'test@example.com')
      expect(user2).to_not eq(false)
    end
  end
end