# frozen_string_literal: true
module Api
  module V1
    class RatingsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_rating, only: %i[show update destroy]

      #GET /product/:id
      def index
        @ratings = Rating.where(product_id: params[:product_id])
        render json: @ratings
      end

      def show
        render json: @rating
      end

      #POST /product/:id
      def create
          @rating = Rating.new(rating_params)
          if @rating.save
            render json: @rating, success: true
          else
            render json: @rating.errors, status: :unprocessable_entity
          end
      end

      def update
        if @rating.update(rating_params)
          render json: @rating
        else
          render json: @rating.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @rating.destroy
      end

      private

      def set_rating
        @rating = current_user.ratings.find(params[:id])
      end

      def rating_params
        params.require(:rating).permit(
          :product_id,
          :user_id,
          :value,
          :comment
        )
      end
    end
  end
end
