require 'rails_helper'

RSpec.describe Order, type: :model do
    before do
      @order = FactoryBot.build(:order)
    end

    describe '商品購入機能' do
      context '商品を購入できる場合'do
        it '必要な情報を適切に入力すると購入ができる' do
          expect(@order).to be_valid
        end

        it '建物名が空でも購入することができる' do
          @order.building_name = ""
          expect(@order).to be_valid
        end
      end

      context '商品を購入できない場合' do
        it 'クレジットカード情報が空では購入ができない' do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end

        it '郵便番号が空では購入ができない' do
          @order.post_code = ""
          @order.valid?
          expect(@order.errors.messages).to include({:post_code => ["can't be blank", "is invalid", "is the wrong length (should be 8 characters)"]})
        end

        it '郵便番号にハイフンがないと登録できない' do
          @order.post_code = "12345678"
          @order.valid?
          expect(@order.errors.full_messages).to include("Post code is invalid")
        end

        it '郵便番号が8桁でないと購入できない' do
          @order.post_code = "123-456"
          @order.valid?
          expect(@order.errors.full_messages).to include("Post code is invalid", "Post code is the wrong length (should be 8 characters)")
        end

        it '都道府県(prefecuture_id)が1だと購入できない' do
          @order.prefecture_id = '1'
          @order.valid?
          expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it '市区町村が空では購入できない' do
          @order.city = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end
      
        it '電話番号が空では購入できない' do
          @order.phone_number = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号が11桁以内でなければ購入できない' do
          @order.phone_number = "080123456789"
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
     end
   end
end
