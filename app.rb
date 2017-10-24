require('sinatra')
require('sintra/contrib/all')
require_relative('./controllers/owners_controller.rb')

get '/owners' do
  @owners = Owner.all()
  erb(:index)
end
