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


get '/bookings/new' do
  @members = Member.all
  @lessons = Lesson.all
  erb(:"bookings/new")
end
get '/bookings/:id/delete' do
  @booking = Booking.find(params['id'].to_i)
  erb(:'bookings/delete')
end

get '/bookings/:id/member_to_lesson' do
  @lessons = Lesson.all
  erb(:"bookings/member_to_lesson")
end

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save
  redirect to('/bookings')
end

post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end


get '/bookings/:id/member_to_lesson' do
  @lessons = Lesson.all
  erb(:"bookings/member_to_lesson")
end
