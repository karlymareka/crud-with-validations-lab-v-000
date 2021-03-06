require 'pry'

class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]

    def show
    end

    def index
      @songs = Song.all
    end

    def new
      @song = Song.new
    end

    def create
      #binding.pry
      @song = Song.new(song_params[:song])

      # if @song.save
      #     redirect song_path(@song)
      #   else
      #     render :new
      #   end

      if @song.valid?
        @song.save
        redirect_to song_path(@song)
      else
        render :new
      end
    end

    def edit
    end

    def update
      @song.update(song_params[:song])

      if @song.update(song_params[:song])
        redirect_to song_path(@song)
      else
        render :edit
      end

    end

    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to action: "index"
    end

    private

    def song_params
      params.permit(:song => [:title, :released, :release_year,
        :artist_name, :genre])
    end

    def set_song!
      @song = Song.find(params[:id])
    end

end
