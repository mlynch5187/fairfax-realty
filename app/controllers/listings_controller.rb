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
      flash[:error] = merchant.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def listing_params
    params.permit(:address, :city, :state, :zip, :description, :image)
  end
end
