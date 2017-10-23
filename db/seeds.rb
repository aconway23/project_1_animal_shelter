require_relative('../models/owner')
require('pry')

Owner.delete_all()

owner1 = Owner.new({
  "first_name" => "Dawg",
  "last_name" => "Napper",
  "review_date" => "2000-01-01",
  "address" => "Brick House, Edinburgh",
  "email" => "dn@gmail.com",
  "phone" => "07991144555"

})

owner1.save()
binding.pry
nil
