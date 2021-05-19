class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(purchase_params)
    if @order_form.valid?
      @order_form.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private


  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel, :user_id, :item_id)
  end
end