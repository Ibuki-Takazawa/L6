class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end
  
  def create
    @cart = current_cart
    product = Product.find(cart_item_params[:product_id])
    @cart_item = @cart.cart_items.find_by(product_id: product.id)
    
    if @cart_item
      @cart_item.qty += cart_item_params[:qty].to_i
    else
      @cart_item = @cart.cart_items.new(cart_item_params)
    end

    if @cart_item.save
      redirect_to cart_path(@cart), notice: '商品をカートに追加しました。'
    else
      render :new, alert: '商品をカートに追加できませんでした。'
    end
  end

  def destroy
    cart = current_cart
    cart_item = cart.cart_items.find(params[:id])
    
    if cart_item.destroy
      redirect_to cart_path(cart), notice: '商品をカートから削除しました。'
    else
      redirect_to cart_path(cart), alert: '商品を削除できませんでした。'
    end
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:qty, :product_id)
  end
end
