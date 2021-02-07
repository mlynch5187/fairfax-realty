require 'rails_helper'

RSpec.describe("Admin Merchants Index Page") do
  describe "As an admin when I visit the admin login page " do
    before(:each) do
      @admin = User.create(email: "admin@example.com",
                           password: "123456",
                           role: 1)
      @maple_street = Listing.create(address: '9106 Maple Way',
                                     city: 'Catonsville',
                                     state: 'MD',
                                     zip: 21228,
                                     image: 'https://cdn.vox-cdn.com/thumbor/XUdUk_rKJ8WDTd0zksnnicYDwbY=/0x0:3760x2500/1200x800/filters:focal(1580x950:2180x1550)/cdn.vox-cdn.com/uploads/chorus_image/image/65135516/shutterstock_349464740.0.jpg',
                                     description: "A beautiful home!")
      @shady_grove = Listing.create(address: '3167 Shady Grove Road',
                                    city: 'Columbia',
                                    state: 'MD',
                                    zip: 21045,
                                    image: 'https://i0.wp.com/movingtips.wpengine.com/wp-content/uploads/2020/08/new-townhouse.jpg?fit=1024%2C684&ssl=1',
                                    description: "Located near Lake Centennial. The autumn colors are gorgeous!")
    end

    it "I can login to access the admin dashboard" do
      visit "/admin/login"

      fill_in :email, with: @admin.email
      fill_in :password, with: @admin.password

      click_button "Login"

      expect(current_path).to eq("/admin/dashboard")
      expect(page).to have_content("You have logged in")
      expect(page).to have_content("9106 Maple Way")
      expect(page).to have_content("3167 Shady Grove")
      expect(page).to have_link("New Listing")
      expect(page).to have_link("Edit Listing")
    end
  end
end
