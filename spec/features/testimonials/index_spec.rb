require 'rails_helper'

RSpec.describe "Testimonials Index Page", type: :feature do
  describe 'As a visitor' do
    before :each do
      @jill_hartford = Testimonial.create(description: 'Lucie is kind and professional. I highly recommend her!',
                                          author: "Jill Hartford")
      @mike_williams = Testimonial.create(description: 'I got a great deal on my new home thanks to Lucie!',
                                          author: "Michael Williams")
    end

    it "shows all testimonials with links" do

      visit "/testimonials"

      expect(page).to have_content(@jill_hartford.description)
      expect(page).to have_content(@jill_hartford.author)
      expect(page).to have_content(@mike_williams.description)
      expect(page).to have_content(@mike_williams.author)
    end
  end
end
