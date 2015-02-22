class OrdersController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i
    

    order = Order.new({:quantity => quantity, :user_id => current_user.id, :product_id => product.id})

    order.subtotal = order.calculate_subtotal
    order.tax = order.calculate_tax
    order.total = order.calculate_total 
    order.save

    flash[:success] = "thanks for shopping"
    redirect_to "/"
  end

end

