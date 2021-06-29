module Api
  module V1
    class CartsController < ApplicationController
      before_action :authorize_access_request!
      #GET /carts
      def index
        @carts = current_user.carts.all
        @products = []
        @carts.each do |cart|
          @products << { product: Product.find(cart.product_id), quantity: cart.quantity }
        end
        render json: @products
      end
      #POST /carts
      def create
        @cart = current_user.carts.build(product_id: params[:product_id], quantity: params[:quantity])
        if @cart.save
          render json: @cart
        else
          render @cart.errors, status: :unprocessable_entity
        end
      end
      #PATCH/PUT /address/:id
      def update
        if @cart.update(cart_params)
          render json: @cart
        else
          render @cart.errors, status: :unprocessable_entity
        end
      end
      #DELETE /address/:id
      def destroy
        @cart.destroy
      end

      private
    end
  end
end
