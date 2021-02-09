require 'rails_helper'

RSpec.describe 'Admin Testimonials Edit Page', type: :feature do
  describe 'As a logged in admin' do
    before :each do
      @admin = User.create(email: "admin@example.com",
                           password: "123456",
                           role: 0)
                           @jill_hartford = Testimonial.create(description: 'Lucie is kind and professional. I highly recommend her!',
                                                               author: "Jill Hartford")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/admin/dashboard'

      expect(page).to have_content("Lucie is kind and professional. I highly recommend her!")
    end

    it 'I can edit an existing testimonial' do

      click_link "Edit Testimonial"

      fill_in :description, with: "I made a new testimonial to replace the old one"
      fill_in :author, with: "Jill Hartfordson"

      click_button "Edit Testimonial"

      new_testimonial = Testimonial.last

      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_content("I made a new testimonial to replace the old one")
      expect(new_testimonial.description).to eq("I made a new testimonial to replace the old one")
      expect(new_testimonial.author).to eq("Jill Hartfordson")
    end

    it 'I must fill out all form fields to submit' do

      click_link "Edit Testimonial"

      fill_in :description, with: ""
      fill_in :author, with: ""

      click_button "Edit Testimonial"

      new_testimonial = Testimonial.last

      expect(current_path).to eq("/admin/testimonials/#{new_testimonial.id}/edit")
      expect(page).to have_content("Description can't be blank and Author can't be blank")
    end
  end
end
