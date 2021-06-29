module Api
  module V1
    class OffersController < ApplicationController
      def index
      end

      def show

      end

      def update

      end

      def create
        @offer = Offer.new(offer_params)
        if @offer.save
          render json: @offer, success: true
        else
          render json: @offer.errors, status: :unprocessable_entity
      end

      private

      def offer_params
        params.require(:offer).permit(:name, :start_date, :end_date, :type, :ammount, :)
      end
    end
  end
end
