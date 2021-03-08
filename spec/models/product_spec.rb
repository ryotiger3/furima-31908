require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/item-sample.png')
  end
 describe '商品出品機能' do
   context '商品出品できる場合' do 
     it '必要な情報を適切に入力すると商品の出品ができること' do
       expect(@product).to be_valid
     end

     it '販売価格が半角数字なら出品できること' do
       @product.price = 500
       expect(@product).to be_valid
     end
   end

   context '商品出品できない場合' do
     it '商品画像が1枚ないと出品できないこと' do
       @product.image = nil
       @product.valid?
       expect(@product.errors.full_messages).to include("Image can't be blank")
     end

     it '商品名が空では出品できないこと' do
       @product.name = ""
       @product.valid?
       expect(@product.errors.full_messages).to include("Name can't be blank")
     end

     it '商品の説明が空では出品できないこと' do
       @product.description = ""
       @product.valid?
       expect(@product.errors.full_messages).to include("Description can't be blank")
     end

     it 'カテゴリーが空では出品できないこと' do
       @product.category_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Category must be other than 1")
     end

     it '商品の状態が空では登録できないこと' do
       @product.condition_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Condition must be other than 1")
     end

     it '配送料の負担が空では出品できないこと' do
       @product.shipping_charged_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Shipping charged must be other than 1")
     end

     it '発送元の地域が空では出品できないこと' do
       @product.prefecture_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
     end

     it '発送までの日数が空では出品できないこと' do
       @product.shipping_days_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Shipping days must be other than 1")
     end

     it '販売価格が空では出品できないこと' do
       @product.price = ""
       @product.valid?
       expect(@product.errors.full_messages).to include("Price can't be blank")
     end

     it '販売価格が¥300以下だと出品できないこと' do
       @product.price = 299
       @product.valid?
       expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
     end

     it '販売価格が¥9,999,999以上だと出品できないこと' do
       @product.price = 10000000
       @product.valid?
       expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end

     it '販売価格が半角数字でなければ出品できないこと' do
       @product.price = "１０００"
       @product.valid?
       expect(@product.errors.full_messages).to include("Price is not a number")
     end

     it '販売価格が半角英数混合では出品できないこと' do
       @product.price = "300yen"
       @product.valid?
       expect(@product.errors.full_messages).to include("Price is not a number")
     end

     it '販売価格が半角英語だけでは出品できないこと' do
       @product.price = "aaaaa"
       @product.valid?
       expect(@product.errors.full_messages).to include("Price is not a number")
     end
   end
  end
end
