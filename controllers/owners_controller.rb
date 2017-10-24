
require_relative('../models/owner.rb')

get '/owners' do
  @owners = Owner.all()
  erb(:index)
end
