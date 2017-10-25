require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/owners_controller.rb')
require_relative('./controllers/animals_controller.rb')

get '/' do
  @animals = Animal.all
  @owners = Animal.all
  erb(:index)
end
