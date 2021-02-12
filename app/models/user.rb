class User < ApplicationRecord
  has_many :appointments

  validates_presence_of :email
  validates_presence_of :password, on: :create
  validates :email, uniqueness: true

  enum role: %w(admin)

  has_secure_password
end
