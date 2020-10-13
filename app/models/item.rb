class Item < ApplicationRecord
  hankaku = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :category
    validates :condition
    validates :postage_payer
    validates :prefecture_code
    validates :preparation_day
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid. Input the range of 300 to 9999999 yen.' }, format: { with: hankaku, message: 'is invalid. Input using half-width English numbers.' }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day
end
