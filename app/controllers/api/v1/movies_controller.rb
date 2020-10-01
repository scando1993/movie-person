module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: [:show, :update, :destroy]
      before_action :change_release_year, only: [:show]
      before_action :change_release_years, only: [:index]
      before_action :authorize_access_request! , except: [:show, :index]

      # GET /movies
      def index
        # @movies = Movie.all

        render json: @movies, include: [:casting, :directors, :producers]
      end

      # GET /movies/1
      def show
        render json: @movie, include: [:casting, :directors, :producers]
      end

      # POST /movies
      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: @movie, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /movies/1
      def update
        if @movie.update(movie_params)
          render json: @movie
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # DELETE /movies/1
      def destroy
        @movie.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_movie
        @movie = Movie.find(params[:id])
      end
      def change_release_years
        @movies = Movie.all
        @movies.each do |movie|
          movie.releaseYear = RomanNumber.new(movie.releaseYear).roman
        end
      end
      def change_release_year
        @movie = Movie.find(params[:id])
        roman = RomanNumber.new(@movie.releaseYear)
        @movie.releaseYear = roman.roman
      end
      # Only allow a trusted parameter "white list" through.
      def movie_params
        params.require(:movie).permit(:title, :releaseYear)
      end
    end
  end
end