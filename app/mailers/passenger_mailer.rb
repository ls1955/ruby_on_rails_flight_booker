class PassengerMailer < ApplicationMailer
  default from: "donotreply@odin.com"

  def confirmation_email
    @passenger = params[:passenger]
    @flight = @passenger.booking.flight

    mail to: @passenger.email, subject: "Odin - Confirm your booking"
  end
end
