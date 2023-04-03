class FlightsController < ApplicationController
  def index
    @airports = Airport.select(:name).distinct
    @tickets_range = (1..4)
    @dates = Flight.pluck(:depart).map(&:to_date).uniq

    if params[:commit] == "Search"
      @search_results = Flight.joins(:departure_airport, :arrival_airport)
                              .same_date(Date.parse(params[:depart]))
                              .where(departure_airport: { name: params[:departure_airport_name] })
                              .where(arrival_airport: { name: params[:arrival_airport_name] })
    end
  end
end
