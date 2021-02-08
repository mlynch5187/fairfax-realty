class Admin::ListingsController < ApplicationController

  def new; end

  def edit
    @listing = Listing.find(params[:listing_id])
  end
end
