require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailが重複する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailに@が含まれない場合は登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが6文字以上ないと登録できない' do
        @user.password = '1qaz'
        @user.password_confirmation = '1qaz'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordが全角を含む場合登録できない' do
        @user.password = '１あ１あ１あ'
        @user.password_confirmation = '１あ１あ１あ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = '1q1q1q'
        @user.password_confirmation = '2w2w2w'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'last_nameに半角が含まれる場合登録できない' do
        @user.last_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'last_nameに数字が含まれる場合登録できない' do
        @user.last_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'last_nameに英字が含まれる場合登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameに半角が含まれる場合登録できない' do
        @user.first_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'first_nameに数字が含まれる場合登録できない' do
        @user.first_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'first_nameに英字が含まれる場合登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'last_name_kanaにカナ以外が含まれる場合登録できない' do
        @user.last_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaに半角が含まれる場合登録できない' do
        @user.last_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaに数字が含まれる場合登録できない' do
        @user.last_name_kana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'last_name_kanaに英字が含まれる場合登録できない' do
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'first_name_kanaにカナ以外が含まれる場合登録できない' do
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaに半角が含まれる場合登録できない' do
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaに数字が含まれる場合登録できない' do
        @user.first_name_kana = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'first_name_kanaに英字が含まれる場合登録できない' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
