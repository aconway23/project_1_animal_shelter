require_relative('../models/owner.rb')


get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/create")
end

post '/owners' do
  @owner = Owner.new( params )
  @owner.save()
  redirect to '/owners'
end

post '/owners/:id/delete' do
  @owner = Owner.find( params[:id].to_i )
  @owner.delete()
  erb(:"owners/destroy")
end

post '/owners/:id' do
  @owner = Owner.new( params )
  @owner.update()
  erb(:"owners/update")
end

get '/owners/:id' do
  @owner = Owner.find( params[:id].to_i )

  #@owner.pretty_name
  #@owner['first_name'] + ' ' + @owner['last_name']
  #Animal.find_by_owner_id(@owner["id"])

  @animals = @owner.animals()

  erb(:"owners/show")
end
