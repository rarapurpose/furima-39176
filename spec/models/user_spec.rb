require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  #pending "add some examples to (or delete) #{__FILE__}"
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規作成できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?                
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it 'emailが一意性であること' do 
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?        
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'mail'
        @user.valid?        
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが6文字以上文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?        
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordは、半角英数字混合での入力が必須であること' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?                
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordで半角英字のみでは登録できない' do
        @user.password = 'qqqqqq'
        @user.password_confirmation = 'qqqqqq'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it 'passwordで半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ａａa 0００'
        @user.password_confirmation = 'ａａa 0００'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end


      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?        
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'お名前(全角)は、名字が必須であること' do
        @user.last_name = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前を入力してください')    
      end

      it 'お名前(全角)は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前を入力してください')    
      end

      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'yamada'
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前全角文字を使用してください')    
      end

      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'taro'
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前全角文字を使用してください')    
      end

      it 'お名前カナ(全角)は、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前カナを入力してください')    
      end

      it 'お名前カナ(全角)は、名前が必須であること' do 
        @user.first_name_kana = ''
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前カナを入力してください')    
      end

      it 'お名前カナ(全角)は、名字が全角（カタカナ）での入力が必須であること' do
          @user.last_name_kana = '山田'
          @user.valid?          
          expect(@user.errors.full_messages).to include('お名前カナ全角カタカナのみで入力して下さい')
      end

      it 'お名前カナ(全角)は、名前が全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = '山田'
        @user.valid?        
        expect(@user.errors.full_messages).to include('お名前カナ全角カタカナのみで入力して下さい')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?                
        expect(@user.errors.full_messages).to include('生年月日を入力してください')    
      end
    end
          
   end
end
