class Listing < ApplicationRecord

  validates_presence_of :address,
                        :city,
                        :state,
                        :zip,
                        :image,
                        :description
end
