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
  redirect to "/animals"
end

post '/animals/:id/delete' do
  @animal = Animal.find( params[:id].to_i )
  @animal.delete()
  redirect to '/animals'
end

get '/animals/:id' do
  @animal = Animal.find( params[:id].to_i)
  @owner = Owner.find( @animal.adopted_by().to_i )
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find( params[:id].to_i)
  @owner = Owner.find( @animal.adopted_by().to_i )
  @owners = Owner.all
  erb(:"animals/edit")
end

post '/animals/:id' do
  @animal = Animal.new( params )
  @animal.update()
  redirect to "/animals/#{params[:id]}"
end

get '/animals/' do
  @animal = Animal.find( params[:id].to_i )
  erb(:show)
end
