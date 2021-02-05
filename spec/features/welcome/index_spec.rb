require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  it "shows the realtor name" do

    visit "/"

    expect(page).to have_content("Lucie Lynch")
  end

  it "has the realtor headshot" do

    visit "/"

    expect(page).to have_css("img[src*='assets/images/lucie_realtor.jpg']")
  end

  it "has links to each section" do

    visit "/"

    expect(page).to have_link("Testimonials")
    expect(page).to have_link("Listings")
    expect(page).to have_link("Book A Free Consultation")
  end
end
