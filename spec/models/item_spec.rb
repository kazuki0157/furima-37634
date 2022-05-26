require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it '全ての項目が入力されていれば出品できる' do
        binding.pry
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'category_idが0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが0では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'pay_for_shipping_idが0では登録できない' do
        @item.pay_for_shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Pay for shipping can't be blank"
      end

      it 'ken_name_idが0では登録できない' do
        @item.ken_name_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Ken name can't be blank"
      end

      it 'shipping_days_idが0では登録できない' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping days can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299'
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end

      it 'priceに少数が含まれる場合登録できない' do
        @item.price = 300.1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be an integer'
      end

      it 'priceが半角数字以外が含まれる場合登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
