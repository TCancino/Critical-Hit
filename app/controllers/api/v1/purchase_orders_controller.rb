module Api
  module V1
    class PurchaseOrdersController < ApplicationController
      before_action :authorize_access_request!
      # GET /purchase_orders
      def index
        @purchase_orders = current_user.purchase_orders.all
        @orders = []
        if @purchase_orders.length > 0 
          @purchase_orders.each do |order|
            order = {
              number: @purchase_order.number,
              products: @purchase_order.products,
              amount: @purchase_order.ammount,
              payment_type: @purchase_order.payment_type,
              status: @purchase_order.status,
              date: @purchase_order.date
            }
            @orders << order
          end
        end

        render json: @orders
      end

      # GET /purchase_order/:id
      def show
        @purchase_order = current_user.purchase_orders.find(params[:id])
    
        render json: { data: @purchase_order, status: 'ok', message: 'success' }
      end

      # POST /purchase_orders
      def create
        @purchase_order = current_user.purchase_orders.build()
        if @purchase_order.save
          @carts = current_user.carts.all
          @carts.each do |cart|
            @cart_detail = @purchase_order.purchase_order_detail.build(product_id: cart.product_id)
            if @cart_detail.save
              cart.destroy
            end
          end
        end
      end

      private
    end
  end
end
