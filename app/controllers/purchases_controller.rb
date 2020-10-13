class PurchasesController < ApplicationController
  before_action :set_item, only: [:index]

  def index
  end
 
  private
  
  def set_item
    @items = Item.find(params[:item_id])
  end
end
