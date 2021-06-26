# frozen_string_literal: true
module Api
    module V1
        class ProductsController < ApplicationController

            #GET /products
            def index
                @products = Product.all
            
                render json: @products
            end
        
            # GET /products/1
            def show
                render json: @product
            end
        end
    end
end 
