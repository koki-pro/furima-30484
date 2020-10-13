class Address < ApplicationRecord
  with_options presence: true do
    validates :post_code,      format: { with:  /\A\d{3}[-]\d{4}\z/, message: 'は、数字3桁＋ハイフン（-）＋数字4桁の形式で入力してください' }
    validates :prefecture_code
    validates :city
    validates :Address
    validates :building_name
    validates :phone_number
  end

  validates :prefecture_code_id,  numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture_code
end
