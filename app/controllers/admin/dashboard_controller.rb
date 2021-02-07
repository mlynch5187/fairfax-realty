class Admin::DashboardController < ApplicationController

  # before_action :require_admin

  def index
    @listings = Listing.all
  end

end
