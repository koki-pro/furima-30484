require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end
  describe '購入機能の確認' do
    context '購入情報が保存される時' do
      it 'token,post_code,prefecture_code_id,city,house_number,building_name,phone_numberがあれば保存ができる' do
        expect(@purchase_address).to be_valid
      end

      it 'prefecture_codeが「---」以外を選択していれば保存ができること' do
        @purchase_address.prefecture_code_id = 2
        expect(@purchase_address).to be_valid
      end

      it 'post_codeが数字３桁＋ー＋数字４桁であれば保存ができること' do
        @purchase_address.post_code = "123-4567"
        expect(@purchase_address).to be_valid
      end

      it 'phone_numberが１０桁でハイフンなしであれば保存ができること' do
        @purchase_address.phone_number = "1234567890"
        expect(@purchase_address).to be_valid
      end

      it 'phone_numberが１1桁でハイフンなしであれば保存ができること' do
        @purchase_address.phone_number = "12345678901"
        expect(@purchase_address).to be_valid
      end

      it 'building_nameが空でも保存ができること' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報が保存されない時' do
      it 'tokenが空であれば保存ができないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では保存ができないこと' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンが含まれていなければ保存ができないこと' do
        @purchase_address.post_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code は、数字3桁＋ハイフン（-）＋数字4桁の形式で入力してください")
      end

      it 'prefecture_code_idが「---」を選択していた場合保存ができないこと' do
        @purchase_address.prefecture_code_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture code must be other than 1")
      end

      it 'cityが空では保存ができないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では保存ができないこと' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では保存ができないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンが含まれている場合保存ができないこと' do
        @purchase_address.phone_number = "123-4567-890"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number は、ハイフンは使用せず数字は１０桁または１１桁で入力してください")
      end

      it 'phone_numberが１０桁か１１桁でなければ保存ができないこと' do
        @purchase_address.phone_number = "123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number は、ハイフンは使用せず数字は１０桁または１１桁で入力してください")
      end
    end

  end
end
