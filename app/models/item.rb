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

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
