# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ApplicationController
      def index
        @people = Person.all
        render json: @people
      end

      def show
        @person = Person.find(params[:id])
        render json: @person
      end

      def create
        @person = Person.new(person_params)

        if @person.save
          render json: @person, status: :created
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      def update
        @person = Person.find(params[:id])

        if @person.update(person_params)
          render json: @person
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @person = Person.find(params[:id])
        if @person.destroy
          render json: { status: 'Successfully destroyed', data: @person }, status: :ok
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      def create_with_detail
        @person = Person.new(person_params)
        @person.build_detail(detail_params)

        if @person.save
          response = { person: @person, detail: @person.detail }
          render json: response, status: :created
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      private

      def person_params
        params.require(:person).permit(:email)
      end

      def detail_params
        params.permit(:name, :age, :title, :phone)
      end
    end
  end
end
