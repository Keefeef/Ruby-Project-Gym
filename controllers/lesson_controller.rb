require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/lessons' do
  @lessons = Lesson.all
  erb (:"lessons/index")
end

get '/lessons/new' do
  erb(:'lessons/new')
end

get '/lessons/:id/delete' do
  @lesson = Lesson.find(params['id'].to_i)
  erb(:'lessons/delete')
end

get '/lessons/:id/show' do
  @lesson = Lesson.find(params['id'].to_i)
  erb(:'lessons/show')
end


post '/lessons/:id' do
  lesson = Lesson.new(params)
  lesson.update
  redirect to ('/lessons')
end

post '/lessons' do
  lesson = Lesson.new(params)
  lesson.save
  redirect to ("/lessons")
end

post '/lessons/:id/delete' do
  Lesson.delete(params[:id])
  redirect to("/lessons")
end

get '/lessons/:id' do
  @lesson = Lesson.find(params['id'].to_i)
  erb(:'lessons/show')
end

get'/lessons/:id/edit' do
  @lesson = Lesson.find(params['id'].to_i)
  erb(:'lessons/edit')
end

post '/lessons/:id/delete' do
  Lesson.delete(params[:id])
  redirect to("/lessons")
end
