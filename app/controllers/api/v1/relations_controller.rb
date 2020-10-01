module Api
  module V1
    class RelationsController < ApplicationController
      before_action :set_relation, only: [:show, :update, :destroy]
      before_action :authorize_access_request!, except: [:show, :index]

      # GET /relations
      def index
        @relations = MoviesPerson.all

        render json: @relations
      end

      # GET /relations/1
      def show
        render json: @relation
      end

      # POST /relations
      def create
        @relation = MoviesPerson.new(relation_params)

        if @relation.save
          render json: @relation, status: :created
        else
          render json: @relation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /relations/1
      def update
        if @relation.update(relation_params)
          render json: @relation
        else
          render json: @relation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /people/1
      def destroy
        @relation.destroy
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_relation
        @relation = MoviesPerson.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def relation_params
        params.require(:relation).permit(:movie_id, :person_id, :option)
      end
    end
  end
end
