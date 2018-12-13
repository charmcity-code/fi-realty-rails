require 'chronic'

class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to listing_path(@listing)
    else
      render new_listing_path
    end
  end

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find_by(id: params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:street, :city, :state, :zip_code, :property_type, :bedrooms, :bathrooms, :list_price, :list_date, :user_id)
  end
end
