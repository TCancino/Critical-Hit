module Api
  module V1
    class AddressesController < ApplicationController
      before_action :authorize_access_request!
      #GET /addresses
      def index
        @addresses = current_user.addresses.all

        render json: @addresses
      end
      #GET /address/:id
      def show
        @address = current_user.addresses.find(params[:id])
        render json: { data: @address, status: 'ok', message: 'success' }
      end
      #POST /addresses
      def create
        @address = current_user.addresses.build(address_params)
        if @address.save
          render json: @address, status: 'created'
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      end
      #PATCH/PUT /address/:id
      def update
        if @address.update(address_params)
          render json: @address
        else
          rebder @address.errors, status: :unprocessable_entity
        end
      end
      #DELETE /address/:id
      def destroy
        @address.destroy
      end

      private
      def set_address
        @address = current_user.addresses.find(params[:id])
      end
      def address_params
        params.require(:address).permit(:name, :address1, :address2, :state, :city, :region, :country, :user_id)
      end
    end
  end
end
