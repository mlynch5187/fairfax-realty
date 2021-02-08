require 'rails_helper'

RSpec.describe 'Admin Listings New Page', type: :feature do
  describe 'As a logged in admin' do
    it 'I can create a new listing' do

      @admin = User.create(email: "admin@example.com",
                           password: "123456",
                           role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/admin/dashboard'

      click_link "New Listing"

      fill_in :address, with: "12345 Main Street"
      fill_in :city, with: "Baltimore"
      fill_in :state, with: "MD"
      fill_in :zip, with: "21029"
      fill_in :description, with: "A home for everyone"
      fill_in :image, with: "https://wp.zillowstatic.com/streeteasy/2/GettyImages-960885430-afe816.jpg"

      click_button "Create New Listing"

      new_merchant = Listing.last

      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_content("12345 Main Street")
      expect(new_merchant.address).to eq("12345 Main Street")
      expect(new_merchant.city).to eq("Baltimore")
      expect(new_merchant.state).to eq("MD")
      expect(new_merchant.zip).to eq("21029")
      expect(new_merchant.description).to eq("A home for everyone")
      expect(new_merchant.image).to eq("https://wp.zillowstatic.com/streeteasy/2/GettyImages-960885430-afe816.jpg")
    end
  end
end
