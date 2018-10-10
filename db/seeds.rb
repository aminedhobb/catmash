url = 'https://latelier.co/data/cats.json'

cats = JSON.parse(open(url).read)

Cat.destroy_all

puts 'creating cats..'

cats['images'].each do |cat|
  Cat.create!(auid: cat['id'], url: cat['url'])
end

puts 'cats created !'
