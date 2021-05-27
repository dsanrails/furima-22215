class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :order_item, only: [:index]
  before_action :move_to_index, except: [:index]

  def index
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :tel).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def order_item
    redirect_to root_path if current_user.id == @item.user_id
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end