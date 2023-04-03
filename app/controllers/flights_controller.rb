class FlightsController < ApplicationController
  def index
    @airports = Airport.pluck(:name, :id)
    @tickets_range = (1..4)
    @dates = Flight.pluck(:depart).map(&:to_date).uniq

    if params[:commit] == "Search"
      @search_results = Flight.joins(:departure_airport, :arrival_airport)
                              .same_date(Date.parse(params[:depart]))
                              .where(departure_airport_id: params[:departure_airport_id],
                                     arrival_airport_id: params[:arrival_airport_id])
    end
  end
end
