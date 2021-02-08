class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:listing_id])
  end

  def create
    listing = Listing.create(listing_params)
    if listing.save
      redirect_to "/admin/dashboard"
    else
      redirect_to "/admin/listings/new"
      flash[:error] = listing.errors.full_messages.to_sentence
    end
  end

  def update
    listing = Listing.find(params[:listing_id])
    listing.update(listing_params)
    if listing.save
      redirect_to "/admin/dashboard"
    else
      redirect_to "/admin/listings/#{listing.id}/edit"
      flash[:error] = listing.errors.full_messages.to_sentence
    end
  end

  private

  def listing_params
    params.permit(:address, :city, :state, :zip, :description, :image)
  end
end
