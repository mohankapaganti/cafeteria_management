class OrdersController < ApplicationController
  # created by cmd
  # rails generate controller Orders

  skip_before_action :verify_authenticity_token

  def index
    orders = current_user.orders
    #render plain: Order.all.map { |order| order.to_a_string }.join("\n")
  end

  def show
    render plain: Order.find(params[:id]).to_a_string
  end

  def pending_orders
  end

  def create
    @order = Order.where("status = ? and user_id = ?", "being_created", current_user.id).first
    @order.status = "order_confirmed"
    @order.date = Time.now
    @order.save!
    redirect_to root_path
  end

  def update
    @order = Order.find(params[:id])
    @order.status = "order_delivered"
    @order.delivered_at = Time.now
    @order.save!
    redirect_to "/pending_orders"
  end

  def cart
    @order = current_user.orders.where("status = ?", "being_created").first
  end
end
