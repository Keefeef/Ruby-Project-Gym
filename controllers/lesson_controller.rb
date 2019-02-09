require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/lessons' do
  @lessons = Lessons.all
  erb (:"lessons/index")
end

get '/lessons/:id' do
  @lesson = Lesson.find(params['id'].to_i)
  erb(:'lessons/show')
end

post '/lessons' do
  lesson = Lesson.new(params) #Could be accessed by the add lesson button
  lesson.save
  redirect to("/lessons")
end

post '/bitings/:id/delete' do
  Lesson.delete(params[:id])
  redirect to("/lessons")
end
