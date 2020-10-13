class PurchasesController < ApplicationController
  before_action :set_items, only: [:index]

  def index
  end
 
  def create
    
  end

  private
  
  def set_items
    @items = Item.find(params[:item_id])
  end
end
