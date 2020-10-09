class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :category
    validates :condition
    validates :postage_payer
    validates :prefecture_code
    validates :preparation_day
    validates :price 
  end
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  validates :prefecture_code_id, numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day
end
