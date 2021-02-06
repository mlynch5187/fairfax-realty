require 'rails_helper'

RSpec.describe "listings show page", type: :feature do
  describe 'As a visitor' do
    before :each do
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

    it "allows me to view individual listings from the index" do

      visit "/listings"

      click_link("#{@maple_street.address}")

      expect(page).to have_current_path("/listings/#{@maple_street.id}")
      expect(page).to have_css("img[src*='#{@maple_street.image}']")
      expect(page).to have_content("#{@maple_street.address}")
      expect(page).to have_content("#{@maple_street.city}")
      expect(page).to have_content("#{@maple_street.state}")
      expect(page).to have_content("#{@maple_street.zip}")
      expect(page).to have_content("#{@maple_street.description}")
    end
  end
end
