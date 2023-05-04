require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品出品の登録' do
    context '出品ができる場合' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
        
      end
      it "カテゴリー が「---」以外であれば登録できる" do
        @item.detail_category_id = 1
        expect(@item).to be_valid
      end
      it "商品の状態が「---」以外であれば登録できる" do
        @item.detail_condition_id = 1
        expect(@item).to be_valid
      end
      it "配送料の負担が「---」以外であれば登録できる" do
        @item.shipping_option_id = 1
        expect(@item).to be_valid
      end
      it "発送元の地域が「---」以外であれば登録できる" do
        @item.shipping_prefecture_id = 1
        expect(@item).to be_valid
      end
      it "発送までの日数が「---」以外であれば登録できる" do
        @item.shipping_period_id = 1
        expect(@item).to be_valid
      end
      it "価格が半角数字,300円〜9,999,999円であれば登録できる" do
        @item.price = 300
        expect(@item).to be_valid
        
      end
    end

    context '出品ができない場合' do
      it 'ログイン状態でないと出品できない' do
        @item.user_id = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品画像を1枚つけることが必須' do
        @item.image = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須' do
        @item.item_name = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が必須' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーの情報が必須' do
        @item.detail_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end
      it 'カテゴリーの「---」だと出品できない' do
        @item.detail_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category must be other than 0")
      end

      it '商品の状態の情報が必須' do
        @item.detail_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition can't be blank")
      end
      it '商品の状態の「---」だと出品できない' do
        @item.detail_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail condition must be other than 0")
      end

      it '配送料の負担が必須' do
        @item.shipping_option_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping option can't be blank")
      end
      it '配送料の「---」だと出品できない' do
        @item.shipping_option_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping option must be other than 0")
      end

      it '発送元の地域が必須' do
        @item.shipping_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture can't be blank")
      end
      it '発送元の「---」だと出品できない' do
        @item.shipping_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture must be other than 0")
      end

      it '発送までの日数が必須' do
        @item.shipping_period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping period can't be blank")
      end
      it '発送までの日数が「---」だと出品できない' do
        @item.shipping_period_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping period must be other than 0")
      end

      it "価格の項目は必須" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は半角数字が必須" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格の範囲は,300未満だと出品できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲は9,999,999以上だと出品できない" do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end

  end
end

