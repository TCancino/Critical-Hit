module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all
        render json: @categories
      end

      def show
        @category = Category.find(category_params)
        render json: @category
      end

      def destroy
        @category.destroy
      end
      private

      def category_params
        params.require(:category).permit(:name)
    end
  end
end
