class BookingsController < ApplicationController
  def new
    @flight = Flight.find params[:flight_id]
    @booking = Booking.new

    params[:tickets_num].to_i.times do
      # @booking.passengers.build
      @booking.build_passenger
    end
  end

  def create
  end
end
