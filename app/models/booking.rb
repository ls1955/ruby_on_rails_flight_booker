class Booking < ApplicationRecord
  belongs_to :flight
  # has_many :passengers
  belongs_to :passenger

  # accepts_nested_attributes_for :passengers
end
