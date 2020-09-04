require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  describe '存在性のテスト' do
    it '名前が無いとエラー' do
      post.title = ' '
      expect(post).to eq(false)
    end
  end
end
