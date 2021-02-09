require 'rails_helper'

RSpec.describe 'Admin Testimonials New Page', type: :feature do
  describe 'As a logged in admin' do
    before(:each) do
      @admin = User.create(email: "admin@example.com",
                           password: "123456",
                           role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/admin/dashboard'
    end

    it 'I can create a new testimonial' do

      click_link "New Testimonial"

      fill_in :description, with: "I had a great experience! I found the home I was looking for at a reasonable price"
      fill_in :author, with: "Amanda Reynolds"

      click_button "Create New Testimonial"

      new_testimonial = Testimonial.last

      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_content("I had a great experience! I found the home I was looking for at a reasonable price")
      expect(new_testimonial.author).to eq("Amanda Reynolds")
    end
  end
end
