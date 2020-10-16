class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token, :item_id, :user_id, :purchase_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は、数字3桁＋ハイフン（-）＋数字4桁の形式で入力してください' }
    validates :prefecture_code_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は、ハイフンは使用せず数字は１０桁または１１桁で入力してください' }
    validates :token
  end

  validates :prefecture_code_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
