class ItemsController < ApplicationController
  def index
    
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
  
end
