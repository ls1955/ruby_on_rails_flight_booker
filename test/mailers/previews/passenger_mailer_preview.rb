# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email
    @passenger = Passenger.first

    PassengerMailer.with(passenger: @passenger).confirmation_email
  end
end
