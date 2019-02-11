require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  @members = Member.all
  @lessons = Lesson.all
  erb (:"bookings/index")
end
# Not sure about this method

get '/bookings/new' do
  @members = Member.all
  @lessons = Lesson.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  erb (:'bookings/new')
end

post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end
