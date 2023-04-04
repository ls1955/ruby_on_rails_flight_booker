class BookingsController < ApplicationController
  def new
    @flight = Flight.find params[:flight_id]
    @booking = Booking.new

    params[:tickets_num].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new booking_params
    @flight = Flight.find params[:booking][:flight_id]

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find params[:id]
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
