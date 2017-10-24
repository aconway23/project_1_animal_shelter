require_relative('../models/owner')
require('pry')

Owner.delete_all()

hash = {
  "first_name" => "Dawg",
  "last_name" => "Napper",
  "review_date" => "2000-01-01",
  "address" => "Brick House, Edinburgh",
  "email" => "dn@gmail.com",
  "phone" => "07991144555"
}

owner1 = Owner.new(hash)
owner1.save()

Animal.delete_all()

hash = {
  "name" => "Tramp",
  "breed" => "Mongrel",
  "city" => "Edinburgh",
  "admis_date" => "1999-12-12",
  "adopt_date" => "2000-03-03",
  "adopted_by" => owner1.id,
  "adoptable" => true
}

animal1 = Animal.new(hash)
animal1.save()

hash = {
  "name" => "Tim",
  "breed" => "Gorilla",
  "city" => "Edinburgh",
  "admis_date" => "2001-04-05",
  "adoptable" => false
}

animal2 = Animal.new(hash)
animal2.save()

hash = {
  "name" => "Ralph",
  "breed" => "Panda",
  "city" => "Edinburgh",
  "admis_date" => "2006-08-08",
  "adoptable" => false
}

animal3 = Animal.new(hash)
animal3.save()

hash = {
  "name" => "Princess",
  "breed" => "Crocodile",
  "city" => "Edinburgh",
  "admis_date" => "2010-03-01",
}

binding.pry
nil
