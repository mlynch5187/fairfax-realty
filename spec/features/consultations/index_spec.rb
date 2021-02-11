require 'rails_helper'

RSpec.describe "Consulations Index Page", type: :feature do
  describe 'As a visitor' do
    before :each do

    it "shows a section to book consultations" do

      visit "/consultations"
    end
  end
end
