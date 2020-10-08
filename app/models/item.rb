class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
    validates :price 
  end

  belongs_to :user
end
