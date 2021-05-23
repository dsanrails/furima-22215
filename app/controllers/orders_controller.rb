class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
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
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel, :user_id, :item_id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_a257137847eb4007d08eb3cf"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end