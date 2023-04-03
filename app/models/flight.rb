class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_airport_id, :arrival_airport_id, presence: true
  validates :start, :duration, presence: true

  scope :same_date, ->(depart) { where depart: depart.beginning_of_day..depart.end_of_day }
end
