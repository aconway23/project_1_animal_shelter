require_relative('../models/animal.rb')


get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animals/new' do
  @owners = Owner.all
  erb(:"animals/create")
end

post '/animals' do
  @animal = Animal.new( params )
  @animal.save()
  erb(:index)
end

post '/animals/:id/delete' do
  @animal = Animal.find( params[:id].to_i )
  @animal.delete()
  erb(:destroy)
end

post '/animals/:id' do
  @animal = Animal.new( params )
  @animal.update()
  erb(:update)
end

get '/animals/' do
  @animal = Animal.find( params[:id].to_i )
  erb(:show)
end
