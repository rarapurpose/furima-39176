require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

 describe '商品購入機能' do
  context "購入ができる場合" do

    it "必要な情報を適切に入力すれば登録できる" do
      expect(@order_address).to be_valid
    end

    it "user_idが必須で登録できる" do
      @order_address.user_id = 1 
      expect(@order_address).to be_valid
    end
    it "item_idが必須で登録できる" do
      @order_address.item_id = 1 
      expect(@order_address).to be_valid
    end

    it "postal_codeが必須で登録できる" do
      @order_address.postal_code = '111-1111'
      expect(@order_address).to be_valid
    end
    it "postal_codeは「3桁ハイフン4桁」の半角文字列のみ登録できる" do
      @order_address.postal_code = '111-1111'
      expect(@order_address).to be_valid
    end

    it "shipping_prefecture(都道府県)が「---」以外であれば登録できる" do
      @order_address.shipping_prefecture_id = 1
      expect(@order_address).to be_valid
    end
    it "city(市区町村)が必須で登録できる" do
      @order_address.city = '大阪市'
      expect(@order_address).to be_valid
    end
    it "street(番地)が必須で登録できる" do
      @order_address.street = '西区35'
      expect(@order_address).to be_valid
    end
    it "apartment(建物名)は空きでも登録できる" do
      @order_address.apartment = ''
      expect(@order_address).to be_valid
    end
    it '電話番号が必須で登録できる' do
      @order_address.phone_number = '09012345678'
      expect(@order_address).to be_valid
    end
    it '電話番号は、9桁以上11桁以内の半角数値のみ保存できる' do
      @order_address.phone_number = '09012345678'
      expect(@order_address).to be_valid
      
    end

  end


  context '出品ができない場合' do

    it 'user_idが必須' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが必須' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
      
    end

    it 'postal_codeが必須' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeは「3桁ハイフン4桁」ではないと登録できない' do
      @order_address.postal_code = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code は半角「ハイフン表示」で入力してください")
    end
    it 'postal_codeは半角文字列ではないと登録できない' do
      @order_address.postal_code = '１１１－１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code は半角「ハイフン表示」で入力してください")
    end

    it 'shipping_prefecture(都道府県)が---」以外であれば登録できる' do
      @order_address.shipping_prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping prefecture must be other than 0")
    end
    it 'city(市区町村)が必須' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'street(番地)が必須' do
      @order_address.street = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street can't be blank")
    end

    it 'phone_number電話番号が必須' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は、9桁以下なら登録できない' do
      @order_address.phone_number = '0901234'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は半角「ハイフンなし」で入力してください")
    end
    it '電話番号は、12桁以上なら登録できない' do
      @order_address.phone_number = '09012345678888'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は半角「ハイフンなし」で入力してください")
    end

    it '電話番号は、半角数値ではないと登録できない' do
      @order_address.phone_number = '０９０１２３４５６７８'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は半角「ハイフンなし」で入力してください")
    end

    it '電話番号は、ハイフンがあると登録できない' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number は半角「ハイフンなし」で入力してください")
    end


    it 'tokenがが必須' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")   
      
            
    end

  end
 end
end



