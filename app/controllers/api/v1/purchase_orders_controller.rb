module Api
  module V1
    class PurchaseOrdersController < ApplicationController
      before_action :authorize_access_request!
      # GET /purchase_orders
      def index
        @purchase_orders = current_user.purchase_orders.all

        render json: @purchase_orders
      end

      # GET /purchase_order/:id
      def show
        @purchase_order = current_user.purchase_orders.find(params[:id])
        render json: { data: @purchase_order, status: 'ok', message: 'success' }
      end

      # POST /purchase_orders
      def create
        @purchase_order = current_user.purchase_orders.build()
      end

      private
    end
  end
end
