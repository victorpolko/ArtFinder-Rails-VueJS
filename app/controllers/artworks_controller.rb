class ArtworksController < ApplicationController
  before_action :fetch_artwork, only: [:show, :toggle_published]

  def index
    respond_to do |format|
      format.html
      format.json do
        @artworks = Artwork.all#.page(params[:page])

        render json: @artworks.to_json(
          only:    [:id, :title, :artist, :mediums, :year, :published],
          methods: [:medium_image_url, :original_image_url]
        )
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: @artwork.to_json(
          only:    [:id, :title, :artist, :mediums, :year, :published],
          methods: [:original_image_url]
        )
      end
    end
  end

  def toggle_published
    respond_to do |format|
      format.json do
        if @artwork.toggle_published!
          render json: @artwork.to_json(
            only:    [:id, :title, :artist, :mediums, :year, :published],
            methods: [:medium_image_url]
          )
        else
          render json: { errors: @artwork.errors.messages }, status: 422
        end
      end
    end
  end

  private

  def fetch_artwork
    @artwork = Artwork.find(params[:id])
  end
end
