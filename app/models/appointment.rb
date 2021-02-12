class Appointment < ApplicationRecord
  belongs_to :user

  validates_presence_of :email
  validates_presence_of :time
end
