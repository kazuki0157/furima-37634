require 'rails_helper'

RSpec.describe OrderShippingInfo, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.save
      @order_shipping_info = FactoryBot.build(:order_shipping_info, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_info).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_shipping_info.building = ''
        expect(@order_shipping_info).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_shipping_info.token = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Token can't be blank")
      end

      it 'zipが空だと保存できないこと' do
        @order_shipping_info.zip = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Zip can't be blank")
      end

      it 'zipが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_info.zip = '1234567'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include('Zip is invalid. Include hyphen(-)')
      end

      it 'ken_nameを選択していないと保存できないこと' do
        @order_shipping_info.ken_name_id = 0
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Ken name can't be blank")
      end

      it 'city_nameが空だと保存できないこと' do
        @order_shipping_info.city_name = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("City name can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @order_shipping_info.address = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空だと保存できないこと' do
        @order_shipping_info.tel = ''
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telに半角数字以外が含まれる場合登録できないこと' do
        @order_shipping_info.tel = '００００００００００'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include('Tel is not a number')
      end

      it 'telが9桁以下では登録できないこと' do
        @order_shipping_info.tel = '000000000'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include('Tel is invalid')
      end

      it 'telが12桁以上では登録できないこと' do
        @order_shipping_info.tel = '000000000000'
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include('Tel is invalid')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_info.user_id = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping_info.item_id = nil
        @order_shipping_info.valid?
        expect(@order_shipping_info.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
