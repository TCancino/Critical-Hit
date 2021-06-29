module Api
  module V1
    class OffersController < ApplicationController
      def index
        @offers = Offer.all
        render json: @offers
      end

      def show
        @offer = Offer.find(offer_params)
        render json: @offer
      end

      def update
        if @offer.update(offer_params)
          render json: @offer, status: :updated
        else
          render json: @offer.errors, status: :unprocessable_entity
        end
      end

      def create
        @offer = Offer.new(offer_params)
        if @offer.save
          render json: @offer, success: true
        else
          render json: @offer.errors, status: :unprocessable_entity
        end
      end

      private

      def offer_params
        params.require(:offer).permit(
          :name,
          :start_date,
          :end_date,
          :ammount,
          :product_id
        )
      end
    end
  end
end
