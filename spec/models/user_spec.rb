require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくときがうまくいく時' do
      it 'nickname,password,email,first_name,last_name,first_name_reading,last_name_reading,birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字上で英数混合であれば登録ができる' do
        @user.password = '222bbb'
        @user.password_confirmation = '222bbb'
        expect(@user).to be_valid
      end

      it 'first_name,last_nameが全角であれば登録できる' do
        @user.first_name = '山本'
        @user.last_name = '康太'
        expect(@user).to be_valid
      end

      it 'first_name_reading,last_name_readingが全角カタカナであれば登録できる' do
        @user.first_name_reading = 'ヤマモト'
        @user.last_name_reading = 'コウタ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したeamilが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに＠が含まれていなければ登録ができない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end

      it 'last_nameが全角でなければ登録ができない' do
        @user.last_name = 'kouta'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end

      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it 'last_name_readingが空だと登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end

      it 'first_name_readingが全角カタカナでなければ登録ができない' do
        @user.first_name_reading = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid. Input full-width katakana characters.')
      end

      it 'last_name_readingが全角カタカナでなければ登録ができない' do
        @user.last_name_reading = 'kouta'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid. Input full-width katakana characters.')
      end

      it 'birith_dayが空だと登録ができない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
