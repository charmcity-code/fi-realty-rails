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
    # provide all listings to the view for the filter control
    @listings = Listing.all

    # filter the @listings based on user input
    if !params[:list_date].blank?
      if params[:list_date] == "Recent"
        @listings = Listing.recent
      else
        @listings = Listing.older
      end
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find_by(id: params[:id])
  end

  def edit
    @listing = Listing.find_by(id: params[:id])
  end

  def update
    @listing = Listing.find_by(id: params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  private

  def listing_params
    params.require(:listing).permit(:street, :city, :state, :zip_code, :property_type, :bedrooms, :bathrooms, :list_price, :user_id)
  end
end
