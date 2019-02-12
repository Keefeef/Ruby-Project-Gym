require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/member.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

get '/members' do
  @members = Member.all
  erb (:"members/index")
end

get '/members/new' do
  erb(:'members/new')
end

get '/members/:id/show' do
  @member = Member.find(params['id'].to_i)
  erb(:'members/show')
end

get '/members/:id/delete' do
  @member = Member.find(params['id'].to_i)
  erb(:'members/delete')
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to ('/members')
end

post '/members' do
  @member = Member.new(params) #This could be accessed by the add member button
  @member.save
  redirect to('/members')            #at the top of the members page
end

get'/members/:id/edit' do
  @member = Member.find(params['id'].to_i)
  erb(:'members/edit')
end





post '/members/:id/delete' do
  Member.delete(params[:id])
  redirect to("/members")
end

#Still need edit
