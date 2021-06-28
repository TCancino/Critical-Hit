module Api
  module V1
    class SubscriptionsController < ApplicationController
      before_action :authorize_access_request!

      # POST /subscription/:user_id/:product_id
      def subscribe
        @user = User.find_by(id: params[:user_id])
        @product = Product.find_by(id: params[:product_id])
        if @user && @product
          @subscription = Subscription.create(user_id: @user.id, product_id: @product_id.id)
          if @subscription.save
            render json: @subscription, status: :created
          else
            render json: @subscription.errors, status: :unprocessable_entity
          end
        end
      end

      #GET /user/:user_id/subscriptions
      def user_subscriptions
        @subscriptions = Subscription.where(user_id: params[:user_id])
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
    end
  end
end
