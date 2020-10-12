require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'image,name,introduction,category_id,condition_id,postage_payer_id,prefecture_code_id,preparation_day_id,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'category_idが「---」以外を選択していれば保存ができる' do
        @item.category_id = 3
        expect(@item).to be_valid
      end

      it 'condition_idが「---」以外を選択していれば保存ができる' do
        @item.condition_id = 3
        expect(@item).to be_valid
      end

      it 'postage_payer_idが「---」以外を選択していれば保存ができる' do
        @item.postage_payer_id = 3
        expect(@item).to be_valid
      end

      it 'prefecture_code_idが「---」以外を選択していれば保存ができる' do
        @item.prefecture_code_id = 3
        expect(@item).to be_valid
      end

      it 'preparation_day_idが「---」以外を選択していれば保存ができる' do
        @item.preparation_day_id = 3
        expect(@item).to be_valid
      end

      it 'priceが¥300~¥9,999,999の間であるば保存ができること' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空では保存ができないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では保存ができないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductionが空の場合保存ができないこと' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが「---」を選択していた場合保存ができないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idが「---」を選択していた場合保存ができないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'postage_payer_idが「---」を選択していた場合保存ができないこと' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end

      it 'prefecture_code_idが「---」を選択していた場合保存ができないこと' do
        @item.prefecture_code_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture code must be other than 1')
      end

      it 'preparation_day_idが「---」を選択していた場合保存ができないこと' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
      end

      it 'priceが空の場合保存ができないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input the range of 300 to 9999999 yen.')
      end

      it 'prceが¥300以下の場合保存ができないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input the range of 300 to 9999999 yen.')
      end

      it 'price¥9,999,999以上の場合保存ができないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input the range of 300 to 9999999 yen.')
      end

      it 'priceが販売価格は半角数字以外であれば保存ができないこと' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input the range of 300 to 9999999 yen.')
      end
    end
  end
end
