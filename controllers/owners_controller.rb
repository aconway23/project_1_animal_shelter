require_relative('../models/owner.rb')


get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:index)
end

post '/owners' do
  @owner = Owner.new( params )
  @owner.save()
  erb(:create)
end

post '/owners/:id/delete' do
  @owner = Owner.find( params[:id].to_i )
  @owner.delete()
  erb(:destroy)
end

post '/owners/:id' do
  @owner = Owner.new( params )
  @owner.update()
  erb(:update)
end
