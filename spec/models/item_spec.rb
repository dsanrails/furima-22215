require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録がうまくいくとき' do
      it "必要な情報を適切に入力すると登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "商品画像を一枚つけないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "商品名が空だと登録できない" do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Items name can't be blank"
      end
      it "商品の説明が空だと登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "カテゴリーの情報が未選択だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "商品の状態が未選択だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it "配送料が未選択だと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it "発送元の地域が未選択だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it "発送までの日数が未選択だと登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Day must be other than 1"
      end
      it "価格が空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "価格が¥299以下だと登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it "価格が¥10,000,000以上は登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 9999999"
      end
      it "販売価格は半角数字でないと登録できない" do
        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
