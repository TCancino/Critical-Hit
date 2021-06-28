module Api
  module V1
    class SubscriptionsController < ApplicationController
    
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
  end
  end
end
