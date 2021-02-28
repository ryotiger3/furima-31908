require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、date_of_birthが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれないと登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'family_nameが全角入力でなければ登録できないこと' do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.family_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'date_of_birth空では登録できないこと' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
 end
end