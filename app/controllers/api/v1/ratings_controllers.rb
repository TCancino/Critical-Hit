# frozen_string_literal: true
module Api
  module V1
    class RatingsController < ApplicationController

      #GET /product/:id
      def index
        @ratings = Rating.where(product_id: params[:product_id])
        render json: @ratings
      end

      #POST /product/:id
      def create
          @rating = Rating.new(rating_params)
          if @rating.save
            render json: success: true
          else
            render json: @rating.errors, status: :unprocessable_entity
          end
      end

      private

      def rating_params
          params.require(:rating).permit(:product_id, :user_id, :value, :comment)
      end
    end
  end
end
