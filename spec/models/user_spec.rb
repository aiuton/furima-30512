require 'rails_helper'

describe User do
  describe '#create' do

  
    # 入力されている場合のテスト ▼

    it '全ての項目の入力が存在すれば登録できること' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    # email 一意性制約のテスト ▼

    it '重複したemailが存在する場合登録できないこと' do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken', 'has already been taken')
    end

    # nul:false, presence: true のテスト ▼

    it 'nick_nameがない場合は登録できないこと' do
      user = FactoryBot.build(:user, nick_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'family_nameがない場合は登録できないこと' do
      user = FactoryBot.build(:user, family_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'family_name_kanaがない場合は登録できないこと' do
      user = FactoryBot.build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'first_nameがない場合は登録できないこと' do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_name_kanaがない場合は登録できないこと' do
      user = FactoryBot.build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_dayがない場合は登録できないこと' do
      user = FactoryBot.build(:user, birth_day: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end

    # emailの＠混合テスト ▼

    it 'emailが＠混合でなければ登録できないこと' do
      user = FactoryBot.build(:user, email: 'aaaaaa')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    # パスワードの文字数テスト ▼

    it 'passwordが6文字以上であれば登録できること' do
      user = FactoryBot.build(:user, password: 'abc456', encrypted_password: 'abc456')
      expect(user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      user = FactoryBot.build(:user, password: 'abc5', encrypted_password: 'ab345')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    # パスワードの半角英数字混合テスト ▼

    it 'passwordが半角英字のみの登録できないこと' do
      user = FactoryBot.build(:user, password: 'abcdef', encrypted_password: 'abcdef')
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角数字のみの登録できないこと' do
      user = FactoryBot.build(:user, password: '123456', encrypted_password: '123456')
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid')
    end

 
    # 名前全角入力のテスト ▼

    it 'family_nameが全角入力でなければ登録できないこと' do
      user = FactoryBot.build(:user, family_name: 'ｱｲｳｴｵ')
      user.valid?
      expect(user.errors.full_messages).to include('Family name is invalid')
    end

    it 'first_nameが全角入力でなければ登録できないこと' do
      user = FactoryBot.build(:user, first_name: 'ｱｲｳｴｵ')
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid')
    end

    # カタカナ全角入力のテスト ▼

    it 'family_name_kanaが全角カタカナでなければ登録できないこと' do
      user = FactoryBot.build(:user, family_name_kana: 'ああああ')
      user.valid?
      expect(user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      user = FactoryBot.build(:user, first_name_kana: 'ああああ')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end
  end
end
