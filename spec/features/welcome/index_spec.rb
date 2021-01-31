require 'rails_helper'

RSpec.describe "welcome index page", type: :feature do
  it "shows the realtor name" do

    visit "/"

    expect(page).to have_content("Lucie Lynch")
  end
end
