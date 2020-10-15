class PurchasesController < ApplicationController
  before_action :set_items, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to 'items/index' 
    else
      render :index
    end
  end

  private

  def set_items
    @items = Item.find(params[:item_id])
  end

  def address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,
        card: address_params[:token],
        currency: 'jpy'
      )
  end
end
