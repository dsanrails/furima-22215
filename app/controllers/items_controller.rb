class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private

  def items_params
    params.require(:item).permit(:purchase, :image).merge(user_id: current_user.id)
  end
end
