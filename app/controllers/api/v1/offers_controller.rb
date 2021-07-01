module Api
  module V1
    class OffersController < ApplicationController
      before_action :authorize_access_request!, except: %i[show index]
      before_action :set_offer, only: %i[show update destroy]

      def index
        @offers = Offer.all
        render json: @offers
      end

      def show
        @offer = Offer.find(params[:id])
        render json: { offer: @offer, status: 'ok', message: 'success'}
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

      def destroy
        @offer = Offer.find_by(params[:id])
        @offer.destroy
      end

      private
      def set_offer
        @offer = Offer.find(params[:id])
      end

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
