class User < ApplicationRecord
  validates_presence_of :email, :password
  validates_presence_of :password, on: :create
  validates :email, uniqueness: true

  enum role: %w(admin)

  has_secure_password
end
