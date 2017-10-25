require_relative('../models/owner.rb')
require_relative('../models/animal.rb')
require('pry')

Animal.delete_all
Owner.delete_all


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

hash = {
  "first_name" => "Hue",
  "last_name" => "Mann",
  "review_date" => "2000-01-01",
  "address" => "Sand House, Edinburgh",
  "email" => "hm@gmail.com",
  "phone" => "07891233666"
}

owner22 = Owner.new(hash)
owner22.save()

animal1 = Animal.new({

  "name" => "Tramp",
  "breed" => "Mongrel",
  "city" => "Edinburgh",
  "admis_date" => "1999-12-12",
  "adopt_date" => "2000-03-03",
  "image_url" => "https://www.funnypica.com/wp-content/uploads/2012/12/Ugly-Dog-09.jpg",
  "adopted_by" => owner1.id,
  "adoptable" => true
})

animal1.save()



animal2 = Animal.new({

  "name" => "Tim",
  "breed" => "Gorilla",
  "city" => "Edinburgh",
  "admis_date" => "2001-04-05",
  "image_url" => "http://animals.sandiegozoo.org/sites/default/files/2016-09/Gorilla_ZN.jpg",
  "adoptable" => false
})

animal2.save()



animal3 = Animal.new({

  "name" => "Ralph",
  "breed" => "Panda",
  "city" => "Edinburgh",
  "admis_date" => "2006-08-08",
  "image_url" => "https://media4.s-nbcnews.com/j/newscms/2016_36/1685951/ss-160826-twip-05_8cf6d4cb83758449fd400c7c3d71aa1f.nbcnews-ux-2880-1000.jpg",
  "adoptable" => false
})

animal3.save()


animal4 = Animal.new({

  "name" => "Princess",
  "breed" => "Crocodile",
  "city" => "Edinburgh",
  "admis_date" => "2010-03-01",
  "image_url" => "https://news.nationalgeographic.com/content/dam/news/2016/05/24/nile-crocodile/01-nile-crocodile-florida.jpg",
  "adoptable" => false
})

animal4.save()

binding.pry
nil
