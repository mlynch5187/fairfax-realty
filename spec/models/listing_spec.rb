require 'rails_helper'

describe Listing, type: :model do
  describe "validations" do
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
    it { should validate_presence_of :image }
    it { should validate_presence_of :description }
  end  
end
