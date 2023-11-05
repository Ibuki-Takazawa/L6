class ApplicationController < ActionController::Base
  helper_method :current_cart

  private
    def current_cart
        if session[:cart_id]
            Cart.find_by_id(session[:cart_id]) || new_cart
        else
            new_cart
        end
    end
    
    def new_cart
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
end
