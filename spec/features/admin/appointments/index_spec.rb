require 'rails_helper'

RSpec.describe 'Admin Appointments Index Page', type: :feature do
  describe 'As a logged in admin' do
    before(:each) do
      @admin = User.create(email: "admin@example.com",
                           password: "123456",
                           role: 0)

      @appointment_1 = @admin.appointments.create(email: 'interestedclient@mail.com',
                                                  time: '6:00',
                                                  date: "02-17-2021")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit '/admin/dashboard'
    end

    it 'I can view all of my appointments' do
      click_link "My Appointments"

      expect(current_path).to eq('/admin/appointments')
      expect(page).to have_content("Appointment with interestedclient@mail.com")
      expect(page).to have_content("6:00")
      expect(@appointment_1.time).to eq("6:00")
      expect(@appointment_1.email).to eq("interestedclient@mail.com")
    end
  end
end
