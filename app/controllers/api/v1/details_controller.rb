# frozen_string_literal: true

module Api
  module V1
    class DetailsController < ApplicationController
      def index
        @details = Detail.all
        render json: @details
      end

      def show
        @detail = Detail.find(params[:id])
        render json: @detail
      end

      def create
        @detail = Detail.new(detail_params)

        if @detail.save
          render json: @detail, status: :created
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      def update
        @detail = Detail.find(params[:id])

        if @detail.update(detail_params)
          render json: @detail
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @detail = Detail.find(params[:id])
        if @detail.destroy
          render json: { status: 'Successfully destroyed', data: @detail }, status: :ok
        else
          render json: @detail.errors, status: :unprocessable_entity
        end
      end

      private

      def detail_params
        params.require(:detail).permit(:title, :name, :age, :person_id)
      end
    end
  end
end
