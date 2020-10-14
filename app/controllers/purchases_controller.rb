class PurchasesController < ApplicationController
  before_action :set_items, only: [:index]

  def index
    
  end

  def create
    address = Address.create(address_params)
    if address.save
      render 'items/index' 
    else
      render action: :index
    end
  end

  private

  def set_items
    @items = Item.find(params[:item_id])
  end

  def address_params
    params.permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(purchase_id: params[:purchase_id])
  end
end
