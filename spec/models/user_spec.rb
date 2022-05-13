require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
        it "全ての項目が入力されていれば登録できる" do
          expect(@user).to be_valid
          @user.valid?
          binding.pry
        end  
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailが重複する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'emailに@が含まれない場合は登録できない' do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが6文字以上ないと登録できない' do
        @user.password = "1qaz"
        @user.password_confirmation = "1qaz"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = "1q1q1q"
        @user.password_confirmation = "2w2w2w"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end