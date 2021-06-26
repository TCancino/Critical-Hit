# frozen_string_literal: true

module Api
    module V1
      class UsersController < ApplicationController
        before_action :authorize_access_request!, except: %i[show index]
  
        # GET /users
        def index
          @users = Users.all
  
          render json: @users
        end
  
        # GET /artists/1
        def show
          render json: @user
        end
  
        # POST /artists
        def create
          @user = User.new(user_params)
  
          if @artist.save
            render json: @user, status: :created
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /artists/1
        def update
          if @user.update(user_params)
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /artists/1
        def destroy
          @user.destroy
        end
  
        private
  
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end
  
        # Only allow a trusted parameter "white list" through.
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
  