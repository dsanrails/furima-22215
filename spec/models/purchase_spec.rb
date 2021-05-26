require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep(0.1)
    @order = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@order).to be_valid
      end
      it '建物名は空でも登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it '郵便番号が空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it '市区町村が空では登録できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank", 'Tel is invalid')
      end
      it '都道府県が未選択だと登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '電話番号にハイフンがあると登録できない' do
        @order.tel = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号は11桁以内でないと登録できない' do
        @order.tel = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
