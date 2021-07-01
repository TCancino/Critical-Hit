module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :authorize_access_request!, except: %i[show index]
      before_action :set_category, only: %i[show update destroy]

      def index
        @categories = Category.all
        render json: @categories
      end

      def show
        @category = Category.find(category_params)
        render json: @category
      end

      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @category = Category.find_by(params[:id])
        @category.destroy
      end

      private
      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :description)
      end
    end
  end
end
