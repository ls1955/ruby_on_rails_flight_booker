# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_email
    @passengers = [Passenger.first]

    PassengerMailer.with(passengers: @passengers).confirmation_email
  end
end
