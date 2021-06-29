module Api
  module V1
    class SubscriptionsController < ApplicationController
      before_action :authorize_access_request!

      # POST /subscription/:user_id/:product_id
      def create
        @product = Product.find_by(id: params[:product_id])
        if current_user && @product
          @subscription = current_user.subscriptions.build(product_id: params[:product_id])
          if @subscription.save
            render json: @subscription, status: :created
          else
            render json: @subscription.errors, status: :unprocessable_entity
          end
        end
      end

      #GET /subscriptions
      def index
        @subscriptions = current_user.subscriptions.all
        @subscriptions_lists = []
        @subscriptions.each do |sub|
          product = Product.find_by(id: sub["product_id"])
          @subscriptions_lists << {subscription_id: sub.id, product: product}
        end
        render json: @subscriptions_lists
      end

      #DELETE /subscription/1
      def destroy
        @subscription = Subscription.find_by(id: params[:id])
        @subscription.destroy
      end

      private

    end
  end
end
