class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  validates :departure_airport_id, :arrival_airport_id, presence: true
  validates :depart, :duration, presence: true

  scope :same_date, ->(depart) { where depart: depart.beginning_of_day..depart.end_of_day }

  def detail
    <<~DETAIL
      From #{departure_airport}
      To #{arrival_airport}
      Depart at #{depart}
    DETAIL
  end
end
