require 'rails_helper'

RSpec.describe 'Admin Listings Edit Page', type: :feature do
  describe 'As a logged in admin' do
    before :each do
      @admin = User.create(email: "admin@example.com",
                           password: "123456",
                           role: 0)
      @maple_street = Listing.create(address: '9106 Maple Way',
                                     city: 'Catonsville',
                                     state: 'MD',
                                     zip: 21228,
                                     image: 'https://cdn.vox-cdn.com/thumbor/XUdUk_rKJ8WDTd0zksnnicYDwbY=/0x0:3760x2500/1200x800/filters:focal(1580x950:2180x1550)/cdn.vox-cdn.com/uploads/chorus_image/image/65135516/shutterstock_349464740.0.jpg',
                                     description: "A beautiful home!")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/admin/dashboard'

      expect(page).to have_content("9106 Maple Way")
    end

    it 'I can edit an existing listing' do

      click_link "Edit Listing"

      fill_in :address, with: "12345 Main Street"
      fill_in :city, with: "Baltimore"
      fill_in :state, with: "MD"
      fill_in :zip, with: "21029"
      fill_in :description, with: "A home for everyone"
      fill_in :image, with: "https://wp.zillowstatic.com/streeteasy/2/GettyImages-960885430-afe816.jpg"

      click_button "Edit Listing"

      new_listing = Listing.last

      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_content("12345 Main Street")
      expect(new_listing.address).to eq("12345 Main Street")
      expect(new_listing.city).to eq("Baltimore")
      expect(new_listing.state).to eq("MD")
      expect(new_listing.zip).to eq("21029")
      expect(new_listing.description).to eq("A home for everyone")
      expect(new_listing.image).to eq("https://wp.zillowstatic.com/streeteasy/2/GettyImages-960885430-afe816.jpg")

      expect(page).to_not have_content("9106 Maple Way")
      expect(new_listing.address).to_not eq("9106 Maple Way")
      expect(new_listing.city).to_not eq("Catonsville")
      expect(new_listing.zip).to_not eq("21228")
      expect(new_listing.description).to_not eq("A beautiful home!")
    end

    it 'I must fill out all form fields to submit' do

      click_link "Edit Listing"

      fill_in :address, with: ""
      fill_in :city, with: ""
      fill_in :state, with: "MD"
      fill_in :zip, with: "21029"
      fill_in :description, with: "A home for everyone"
      fill_in :image, with: "https://wp.zillowstatic.com/streeteasy/2/GettyImages-960885430-afe816.jpg"

      click_button "Edit Listing"

      new_listing = Listing.last

      expect(current_path).to eq("/admin/listings/#{new_listing.id}/edit")
      expect(page).to have_content("Address can't be blank and City can't be blank")
    end
  end
end
