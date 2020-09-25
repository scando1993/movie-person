module Api
  module V1
    class PeopleController < ApplicationController
      before_action :set_person, only: [:show, :update, :destroy]
      before_action :authorize_access_request!, except: [:show, :index]

      # GET /people
      def index
        @people = Person.all

        render json: @people, include: [:movies_as_actor_or_actress, :movies_as_director, :movies_as_producer]
      end

      # GET /people/1
      def show
        render json: @person, include: [:movies_as_actor_or_actress, :movies_as_director, :movies_as_producer]
      end

      # POST /people
      def create
        @person = Person.new(person_params)

        if @person.save
          render json: @person, status: :created, location: @person
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /people/1
      def update
        if @person.update(person_params)
          render json: @person, include: [:movies_as_actor_or_actress, :movies_as_director, :movies_as_producer]
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end

      # DELETE /people/1
      def destroy
        @person.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = Person.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def person_params
        params.require(:person).permit(:id, :LastName, :FirstName, :Aliases)
      end
    end
  end
end
