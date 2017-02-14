class ArtworksController < ApplicationController
  before_action :fetch_artwork, only: [:show, :toggle_published]

  def index
    respond_to do |format|
      format.html
      format.json do
        @artworks = Artwork.order(:created_at).page(params[:page])

        render json: {
          data: @artworks.to_json(
            only:    [:id, :title, :artist, :mediums, :year, :published],
            methods: [:medium_image_url, :original_image_url]
          ),

          current_page: @artworks.current_page,
          last_page: @artworks.total_pages,
          next_page_url: @artworks.next_page ? url_for(page: @artworks.next_page) : nil,
          prev_page_url: @artworks.prev_page ? url_for(page: @artworks.prev_page) : nil
        }
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
