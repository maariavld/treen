# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "faker"

puts "Cleaning up database..."
BrandPolicy.destroy_all
Review.destroy_all
Brand.destroy_all
Policy.destroy_all
puts "Database cleaned"

puts "Creating policies..."
vegan = Policy.new(title: 'Vegan')
vegan.save
puts "Created policy #{vegan.id} #{vegan.title}."

co_2 = Policy.new(title: 'Carbon Footprint')
co_2.save
puts "Created policy #{co_2.id} #{co_2.title}."

organic = Policy.new(title: 'Organic Fabrics')
organic.save
puts "Created policy #{organic.id} #{organic.title}."

second_hand = Policy.new(title: 'Second Hand')
second_hand.save
puts "Created policy #{second_hand.id} #{second_hand.title}."

fair_trade = Policy.new(title: 'Fair Trade')
fair_trade.save
puts "Created policy #{fair_trade.id} #{fair_trade.title}."

good_cause = Policy.new(title: 'Good Cause')
good_cause.save
puts "Created policy #{good_cause.id} #{good_cause.title}."
puts "Created #{Policy.count} policies."


puts "Creating brands..."

file_secondella = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/secondella_hzfs8j.jpg')
secondella = Brand.new(
      name: 'SECONDELLA',
      address: 'Hohe Bleichen 5, 20354 Hamburg',
      description: 'Designer, Second-Hand, Mode and Accessoires',
      status: "Accepted"
)
secondella.photo.attach(io: file_secondella, filename: 'secondella.jpg', content_type: 'image/jpg')
secondella.save
puts "Created brand #{secondella.id}. #{secondella.name}"
puts "Creating #{secondella.name} \' policies..."
secondella_second_hand = BrandPolicy.new(
            brand_id: secondella.id,
            policy_id: second_hand.id,
            ranking: 5 )
secondella_second_hand.save
puts "Created #{secondella.name} #{second_hand.title}\'s policy."

file_second_schanze = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316145/brands/secondschanze_gzxbmx.jpg')
second_schanze = Brand.new(
      name: 'Second Schanze',
      address: 'Weidenallee 54, 20357 Hamburg',
      description: 'Small, elegant shop stocking second-hand designer apparel, shoes and handbags for women.',
      status: "Accepted"
)
second_schanze.photo.attach(io: file_second_schanze, filename: 'second_schanze.jpg', content_type: 'image/jpg')
second_schanze.save
puts "Created brand #{second_schanze.id}. #{second_schanze.name}"
puts "Creating #{second_schanze.name} \' policies..."
second_schanze_second_hand = BrandPolicy.new(
            brand_id: second_schanze.id,
            policy_id: second_hand.id,
            ranking: 5 )
second_schanze_second_hand.save
puts "Created #{second_schanze.name} #{second_hand.title}\'s policy."

file_fifty = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316143/brands/fifty_orpxgu.jpg')
fifty = Brand.new(
      name: 'FIFTY:FIFTY',
      address: 'Blankeneser Bahnhofstraße 7, 22587 Hamburg',
      description: 'FIFTY: FIFTY combines luxury with the mentality of circular fashion. Vintage fashion and pre-owned are more than just a temporary trend!',
      status: "Accepted"
)
fifty.photo.attach(io: file_fifty, filename: 'fifty.jpg', content_type: 'image/jpg')
fifty.save
puts "Created brand #{fifty.id}. #{fifty.name}"
puts "Creating #{fifty.name} \' policies..."
fifty_second_hand = BrandPolicy.new(
            brand_id: fifty.id,
            policy_id: second_hand.id,
            ranking: 5 )
fifty_second_hand.save
puts "Created #{fifty.name} #{second_hand.title}\'s policy."

file_humana = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/humana_spkkc8.png')
humana = Brand.new(
      name: 'HUMANA',
      address: 'Bremer Str. 2, 21073 Hamburg',
      description: 'Inexpensive second-hand clothing for him and her. From casual wear to highly elegant, from traditional costume to totally trendy!',
      status: "Accepted"
)
humana.photo.attach(io: file_humana , filename: 'humana.png', content_type: 'image/png')
humana.save
puts "Created brand #{humana.id}. #{humana.name}"
puts "Creating #{humana.name} \' policies..."
humana_second_hand = BrandPolicy.new(
            brand_id: humana.id,
            policy_id: second_hand.id,
            ranking: 5 )
humana_second_hand.save
puts "Created #{humana.name} #{second_hand.title}\'s policy."

file_klamottensen = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623313715/brands/Klamottensen_rumqok.jpg')
klamottensen = Brand.new(
      name: 'Klamottensen',
      address: 'Kleine Rainstraße 6, 22765 Hamburg',
      description: 'Klamottensen has selected second-hand clothing as well as delicious waffles and coffee on offer.',
      status: "Accepted"
)
klamottensen.photo.attach(io: file_klamottensen, filename: 'Klamottensen.jpg', content_type: 'image/jpg')
klamottensen.save
puts "Created brand #{klamottensen.id}. #{klamottensen.name}"
puts "Creating #{klamottensen.name} \' policies..."
klamottensen_second_hand = BrandPolicy.new(
            brand_id: klamottensen.id,
            policy_id: second_hand.id,
            ranking: 5 )
klamottensen_second_hand.save
puts "Created #{klamottensen.name} #{second_hand.title}\'s policy."

file_knallbonbon = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/knallbonbon_m1acff.jpg')
knallbonbon = Brand.new(
      name: 'Knallbonbon',
      address: 'Wandsbeker Chaussee 259, 22089 Hamburg',
      description: 'Cutting-edge second hand fashion at low prices',
      status: "Accepted"
)
knallbonbon.photo.attach(io: file_knallbonbon, filename: 'knallbonbon.jpg', content_type: 'image/jpg')
knallbonbon.save
puts "Created brand #{knallbonbon.id}. #{knallbonbon.name}"
puts "Creating #{knallbonbon.name} \' policies..."
knallbonbon_second_hand = BrandPolicy.new(
            brand_id: knallbonbon.id,
            policy_id: second_hand.id,
            ranking: 5 )
knallbonbon_second_hand.save
puts "Created #{knallbonbon.name} #{second_hand.title}\'s policy."

file_oxfam = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/oxfam_m6ntqu.jpg')
oxfam = Brand.new(
      name: 'Oxfam Shop',
      address: 'Wandsbeker Marktstraße 10, 22041 Hamburg',
      description: 'In the thrift stores Oxfam find a wide range of donated things - from clothing to books and media to household items. You are doing good with every purchase!',
      status: "Accepted"
)
oxfam.photo.attach(io: file_oxfam, filename: 'oxfam.jpg', content_type: 'image/png')
oxfam.save
puts "Created brand #{oxfam.id}. #{oxfam.name}"
puts "Creating #{oxfam.name} \' policies..."
oxfam_second_hand = BrandPolicy.new(
            brand_id: oxfam.id,
            policy_id: second_hand.id,
            ranking: 5 )
oxfam_second_hand.save
puts "Created #{oxfam.name} #{second_hand.title}\'s policy."

file_rudolf = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/rudolf_hs9myg.png')
rudolf = Brand.new(
      name: 'Rudolf Beaufays Superior Vintage Style',
      address: 'Büschstraße 9, 20354 Hamburg',
      description: 'Vintage and secondhand clothing store stocking elegant, traditional and tailored items.',
      status: "Accepted"
)
rudolf.photo.attach(io: file_rudolf, filename: 'rudolf.png', content_type: 'image/png')
rudolf.save
puts "Created brand #{rudolf.id}. #{rudolf.name}"
puts "Creating #{rudolf.name} \' policies..."
rudolf_second_hand = BrandPolicy.new(
            brand_id: rudolf.id,
            policy_id: second_hand.id,
            ranking: 5 )
rudolf_second_hand.save
puts "Created #{rudolf.name} #{second_hand.title}\'s policy."

file_hot_dogs = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/hotdogs_bqetn7.jpg')
hot_dogs = Brand.new(
      name: 'Hot Dogs',
      address: 'Marktstraße 38, 20357 Hamburg',
      description: 'Vintage and secondhand clothing store stocking elegant, traditional and tailored items.',
      status: "Accepted"
)
hot_dogs.photo.attach(io: file_hot_dogs, filename: 'hot_dogs.jpg', content_type: 'image/jpg')
hot_dogs.save
puts "Created brand #{hot_dogs.id}. #{hot_dogs.name}"
puts "Creating #{hot_dogs.name} \' policies..."
hot_dogs_second_hand = BrandPolicy.new(
            brand_id: hot_dogs.id,
            policy_id: second_hand.id,
            ranking: 5 )
hot_dogs_second_hand.save
puts "Created #{hot_dogs.name} #{second_hand.title}\'s policy."

file_jimmy = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316881/brands/jimmy_chw2rx.jpg')
jimmy = Brand.new(
      name: 'Jimmy',
      address: 'Schanzenstraße 5, 20357 Hamburg',
      description: 'Vintage and secondhand clothing store stocking elegant, traditional and tailored items.',
      status: "Accepted"
)
jimmy.photo.attach(io: file_jimmy, filename: 'jimmy.jpg', content_type: 'image/jpg')
jimmy.save
puts "Created brand #{jimmy.id}. #{jimmy.name}"
puts "Creating #{jimmy.name} \' policies..."
jimmy_second_hand = BrandPolicy.new(
            brand_id: jimmy.id,
            policy_id: second_hand.id,
            ranking: 5 )
jimmy_second_hand.save
puts "Created #{jimmy.name} #{second_hand.title}\'s policy."

file_kca = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/knowledge_wxnci8.jpg')
kca = Brand.new(
      name: 'Knowledge Cotton Apparel',
      address: 'Beim Schlump 9, 20144 Hamburg',
      description: 'Jimmy Hamburg is the shop for the latest design, sustainable products and trends from all over the world. The range is completed with handmade shoes, wine, accessories and beautiful tableware from Italy.',
      status: "Accepted"
)
kca.photo.attach(io: file_kca, filename: 'knowledgecottonapparel.jpg', content_type: 'image/jpg')
kca.save
puts "Created brand #{kca.id}. #{kca.name}"

puts "Creating #{kca.name} \' policies..."
kca_vegan = BrandPolicy.new(
            brand_id: kca.id,
            policy_id: vegan.id,
            ranking: 5 )
kca_vegan.save
puts "Created #{kca.name} #{vegan.title}\'s policy."
kca_organic = BrandPolicy.new(
            brand_id: kca.id,
            policy_id: organic.id,
            ranking: 5)
kca_organic.save
puts "Created #{kca.name} #{organic.title}\'s policy."
kca_fair_trade = BrandPolicy.new(
            brand_id: kca.id,
            policy_id: fair_trade.id,
            ranking: 3)
kca_fair_trade.save
puts "Created #{kca.name} #{fair_trade.title}\'s policy."
kca_good_cause = BrandPolicy.new(
            brand_id: kca.id,
            policy_id: good_cause.id,
            ranking: 2)
kca_good_cause.save
puts "Created #{kca.name} #{good_cause.title}\'s policy."
kca_co_2 = BrandPolicy.new(
            brand_id: kca.id,
            policy_id: co_2.id,
            ranking: 5)
kca_co_2.save
puts "Created #{kca.name} #{co_2.title}\'s policy."

file_reco = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316145/brands/recolution_pqicuk.jpg')
recolution = Brand.create(
      name: 'Recolution',
      address: 'Borsteler Chaussee 85/99A, 22453 Hamburg',
      description: 'Urban, sustainable, uncompromising. Long-lasting favorite pieces designed in Hamburg, produced in Europe and developed for a world that should still be livable tomorrow.',
      status: "Accepted"
)
recolution.photo.attach(io: file_reco, filename: 'recolution.jpg', content_type: 'image/jpg')
recolution.save
puts "Created brand #{recolution.id}. #{recolution.name}"
puts "Creating #{recolution.name} \' policies..."
recolution_vegan = BrandPolicy.new(
            brand_id: recolution.id,
            policy_id: vegan.id,
            ranking: 5)
recolution_vegan.save
puts "Created #{recolution.name} #{vegan.title}\'s policy."
recolution_organic = BrandPolicy.new(
            brand_id: recolution.id,
            policy_id: organic.id,
            ranking: 3)
recolution_organic.save
puts "Created #{recolution.name} #{organic.title}\'s policy."
recolution_fair_trade = BrandPolicy.new(
            brand_id: recolution.id,
            policy_id: fair_trade.id,
            ranking: 3)
recolution_fair_trade.save
puts "Created #{recolution.name} #{fair_trade.title}\'s policy."
recolution_good_cause = BrandPolicy.new(
            brand_id: recolution.id,
            policy_id: good_cause.id,
            ranking: 2)
recolution_good_cause.save
puts "Created #{recolution.name} #{good_cause.title}\'s policy."
recolution_co_2 = BrandPolicy.new(
            brand_id: recolution.id,
            policy_id: co_2.id,
            ranking: 3)
recolution_co_2.save
puts "Created #{recolution.name} #{co_2.title}\'s policy."


file_aa = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316143/brands/armedangels_bfnrcg.jpg')
armed_angels = Brand.create(
      name: 'Armed Angels',
      address: 'Gärtnerstraße 20, 20253 Hamburg',
      description: 'We love beautiful, eco and fair products. With a great team it’s our mission to combine fair working conditions and sustainable, high quality materials with beautiful design. Instead of chasing the latest trends we focus on modern, contemporary collections. Fair Fashion instead of Fast Fashion. That’s what we live for.',
      status: "Accepted"
)
armed_angels.photo.attach(io: file_aa, filename: 'armedangels.jpg', content_type: 'image/jpg')
armed_angels.save
puts "Created brand #{armed_angels.id}. #{armed_angels.name}"

puts "Creating #{armed_angels.name} \' policies..."
armed_angels_vegan = BrandPolicy.new(
            brand_id: armed_angels.id,
            policy_id: vegan.id,
            ranking: 5)
armed_angels_vegan.save
puts "Created #{armed_angels.name} #{vegan.title}\'s policy."
armed_angels_organic = BrandPolicy.new(
            brand_id: armed_angels.id,
            policy_id: organic.id,
            ranking: 5)
armed_angels_organic.save
puts "Created #{armed_angels.name} #{organic.title}\'s policy."
armed_angels_fair_trade = BrandPolicy.new(
            brand_id: armed_angels.id,
            policy_id: fair_trade.id,
            ranking: 3)
armed_angels_fair_trade.save
puts "Created #{armed_angels.name} #{fair_trade.title}\'s policy."
armed_angels_good_cause = BrandPolicy.new(
            brand_id: armed_angels.id,
            policy_id: good_cause.id,
            ranking: 5)
armed_angels_good_cause.save
puts "Created #{armed_angels.name} #{good_cause.title}\'s policy."
armed_angels_co_2 = BrandPolicy.new(
            brand_id: armed_angels.id,
            policy_id: co_2.id,
            ranking: 3)
armed_angels_co_2.save
puts "Created #{armed_angels.name} #{co_2.title}\'s policy."

file_bt = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316143/brands/bridge_ae0msk.jpg')
bridge_tunnel = Brand.create(
      name: 'Bridge&Tunnel',
      address: 'Am Veringhof 13, 21107 Hamburg',
      description: 'Bridge & Tunnel stands for design that changes society. Bridge&Tunnel produces sustainably and fairly: in Hamburg with socially disadvantaged people as well as with refugees who have only recently come to Germany. Bridge & Tunnel is a non-profit label. With every purchase of their products, you are helping to get even more socially disadvantaged people into work.',
      status: "Accepted"
)
bridge_tunnel.photo.attach(io: file_bt, filename: 'bridgetunnel.jpg', content_type: 'image/jpg')
bridge_tunnel.save
puts "Created brand #{bridge_tunnel.id}. #{bridge_tunnel.name}"

puts "Creating #{bridge_tunnel.name} \' policies..."
bridge_tunnel_vegan = BrandPolicy.new(
            brand_id: bridge_tunnel.id,
            policy_id: vegan.id,
            ranking: 0 )
bridge_tunnel_vegan.save
puts "Created #{bridge_tunnel.name} #{vegan.title}\'s policy."
bridge_tunnel_organic = BrandPolicy.new(
            brand_id: bridge_tunnel.id,
            policy_id: organic.id,
            ranking: 3)
bridge_tunnel_organic.save
puts "Created #{bridge_tunnel.name} #{organic.title}\'s policy."
bridge_tunnel_fair_trade = BrandPolicy.new(
            brand_id: bridge_tunnel.id,
            policy_id: fair_trade.id,
            ranking: 5)
bridge_tunnel_fair_trade.save
puts "Created #{bridge_tunnel.name} #{fair_trade.title}\'s policy."
bridge_tunnel_good_cause = BrandPolicy.new(
            brand_id: bridge_tunnel.id,
            policy_id: good_cause.id,
            ranking: 5)
bridge_tunnel_good_cause.save
puts "Created #{bridge_tunnel.name} #{good_cause.title}\'s policy."
bridge_tunnel_co_2 = BrandPolicy.new(
            brand_id: bridge_tunnel.id,
            policy_id: co_2.id,
            ranking: 3)
bridge_tunnel_co_2.save
puts "Created #{bridge_tunnel.name} #{co_2.title}\'s policy."

file_cp = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316143/brands/cory_ia9htd.jpg')
cory_phae = Brand.create(
      name: 'Cory&Phäe',
      address: 'Marktstraße 15, 20357 Hamburg',
      description: 'Unique, brave, individual, luxurious and elegant. Cory&Phäe manufactures under fair conditions in Germany. It is particularly important to Cory&Phäe that every item of collection sold makes a contribution to social organizations. Every part of the collection has a sign that says who is supported by the purchase.',
      status: "Accepted"
)
cory_phae.photo.attach(io: file_cp, filename: 'coryphae.jpg', content_type: 'image/jpg')
cory_phae.save
puts "Created brand #{cory_phae.id}. #{cory_phae.name}"

puts "Creating #{cory_phae.name} \' policies..."
cory_phae_vegan = BrandPolicy.new(
            brand_id: cory_phae.id,
            policy_id: vegan.id,
            ranking: 0 )
cory_phae_vegan.save
puts "Created #{cory_phae.name} #{vegan.title}\'s policy."
cory_phae_organic = BrandPolicy.new(
            brand_id: cory_phae.id,
            policy_id: organic.id,
            ranking: 3)
cory_phae_organic.save
puts "Created #{cory_phae.name} #{organic.title}\'s policy."
cory_phae_fair_trade = BrandPolicy.new(
            brand_id: cory_phae.id,
            policy_id: fair_trade.id,
            ranking: 4)
cory_phae_fair_trade.save
puts "Created #{cory_phae.name} #{fair_trade.title}\'s policy."
cory_phae_good_cause = BrandPolicy.new(
            brand_id: cory_phae.id,
            policy_id: good_cause.id,
            ranking: 5)
cory_phae_good_cause.save
puts "Created #{cory_phae.name} #{good_cause.title}\'s policy."
cory_phae_co_2 = BrandPolicy.new(
            brand_id: cory_phae.id,
            policy_id: co_2.id,
            ranking: 3)
cory_phae_co_2.save
puts "Created #{cory_phae.name} #{co_2.title}\'s policy."

file_fk = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/filippa_kzsscd.jpg')
filippa_k = Brand.create(
      name: 'Filippa K',
      address: 'Bleichenbrücke 10, 20354 Hamburg',
      description: 'Filippa K is a sustainable fashion label that offers a conscious choice for those looking for modern styles and timeless design with Scandinavian minimalism and durable quality. The clothes are made from ethically sourced materials and according to responsible standards.',
      status: "Accepted"
)
filippa_k.photo.attach(io: file_fk, filename: 'filippak.jpg', content_type: 'image/jpg')
filippa_k.save
puts "Created brand #{filippa_k.id}. #{filippa_k.name}"

puts "Creating #{filippa_k.name} \' policies..."
filippa_k_vegan = BrandPolicy.new(
            brand_id: filippa_k.id,
            policy_id: vegan.id,
            ranking: 0 )
filippa_k_vegan.save
puts "Created #{filippa_k.name} #{vegan.title}\'s policy."
filippa_k_organic = BrandPolicy.new(
            brand_id: filippa_k.id,
            policy_id: organic.id,
            ranking: 3)
filippa_k_organic.save
puts "Created #{filippa_k.name} #{organic.title}\'s policy."
filippa_k_fair_trade = BrandPolicy.new(
            brand_id: filippa_k.id,
            policy_id: fair_trade.id,
            ranking: 4)
filippa_k_fair_trade.save
puts "Created #{filippa_k.name} #{fair_trade.title}\'s policy."
filippa_k_good_cause = BrandPolicy.new(
            brand_id: filippa_k.id,
            policy_id: good_cause.id,
            ranking: 2)
filippa_k_good_cause.save
puts "Created #{filippa_k.name} #{good_cause.title}\'s policy."
filippa_k_co_2 = BrandPolicy.new(
            brand_id: filippa_k.id,
            policy_id: co_2.id,
            ranking: 3)
filippa_k_co_2.save
puts "Created #{filippa_k.name} #{co_2.title}\'s policy."

file_ns = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/narah_siygjy.jpg')
narah_soleigh = Brand.create(
      name: 'Narah Soleigh',
      address: 'Gertigstraße 25, 22303 Hamburg',
      description: 'Sustainable swimwear & more - for those who like to dress sustainably without compromising on style. Responsibly made from recycled and organic materials.',
      status: "Accepted"
)
narah_soleigh.photo.attach(io: file_ns, filename: 'narah_soleigh.jpg', content_type: 'image/jpg')
narah_soleigh.save
puts "Created brand #{narah_soleigh.id}. #{narah_soleigh.name}"

puts "Creating #{narah_soleigh.name} \' policies..."
narah_soleigh_vegan = BrandPolicy.new(
            brand_id: narah_soleigh.id,
            policy_id: vegan.id,
            ranking: 0)
narah_soleigh_vegan.save
puts "Created #{narah_soleigh.name} #{vegan.title}\'s policy."
narah_soleigh_organic = BrandPolicy.new(
            brand_id: narah_soleigh.id,
            policy_id: organic.id,
            ranking: 4)
narah_soleigh_organic.save
puts "Created #{narah_soleigh.name} #{organic.title}\'s policy."
narah_soleigh_fair_trade = BrandPolicy.new(
            brand_id: narah_soleigh.id,
            policy_id: fair_trade.id,
            ranking: 4)
narah_soleigh_fair_trade.save
puts "Created #{narah_soleigh.name} #{fair_trade.title}\'s policy."
narah_soleigh_good_cause = BrandPolicy.new(
            brand_id: narah_soleigh.id,
            policy_id: good_cause.id,
            ranking: 4)
narah_soleigh_good_cause.save
puts "Created #{narah_soleigh.name} #{good_cause.title}\'s policy."
narah_soleigh_co_2 = BrandPolicy.new(
            brand_id: narah_soleigh.id,
            policy_id: co_2.id,
            ranking: 3)
narah_soleigh_co_2.save
puts "Created #{narah_soleigh.name} #{co_2.title}\'s policy."

file_dd = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316143/brands/danleding_ur75zf.png')
danle_ding = Brand.create(
      name: 'DANLE DING',
      address: '102 Lübecker Str Tür auf der linken Seite, 22087 Hamburg',
      description: 'DANLE DING is a sustainable brand in Germany, which use only eco-friendly material and sustainable manufacture process.',
      status: "Accepted"
)
danle_ding.photo.attach(io: file_dd, filename: 'danleding.png', content_type: 'image/png')
danle_ding.save
puts "Created brand #{danle_ding.id}. #{danle_ding.name}"

puts "Creating #{danle_ding.name} \' policies..."
danle_ding_vegan = BrandPolicy.new(
            brand_id: danle_ding.id,
            policy_id: vegan.id,
            ranking: 5 )
danle_ding_vegan.save
puts "Created #{danle_ding.name} #{vegan.title}\'s policy."
danle_ding_organic = BrandPolicy.new(
            brand_id: danle_ding.id,
            policy_id: organic.id,
            ranking: 5)
danle_ding_organic.save
puts "Created #{danle_ding.name} #{organic.title}\'s policy."
danle_ding_fair_trade = BrandPolicy.new(
            brand_id: danle_ding.id,
            policy_id: fair_trade.id,
            ranking: 3)
danle_ding_fair_trade.save
puts "Created #{danle_ding.name} #{fair_trade.title}\'s policy."
danle_ding_good_cause = BrandPolicy.new(
            brand_id: danle_ding.id,
            policy_id: good_cause.id,
            ranking: 2)
danle_ding_good_cause.save
puts "Created #{danle_ding.name} #{good_cause.title}\'s policy."
danle_ding_co_2 = BrandPolicy.new(
            brand_id: danle_ding.id,
            policy_id: co_2.id,
            ranking: 3)
danle_ding_co_2.save
puts "Created #{danle_ding.name} #{co_2.title}\'s policy."

file_achiy = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316143/brands/achiy_tukoxv.jpg')
achiy = Brand.create(
      name: 'ACHIY',
      address: 'Hohe Bleichen 26, 20354 Hamburg',
      description: 'Inspired by the life of the indigenous people, ACHIY develops meaningful knitwear with unique stories. Every piece is handmade, limited available and follows an original production process. The spirituality with which indigenous communities create their clothing gives the products an inimitable aura.',
      status: "Accepted"
)
achiy.photo.attach(io: file_achiy, filename: 'achiy.jpg', content_type: 'image/jpg')
achiy.save
puts "Created brand #{achiy.id}. #{achiy.name}"

puts "Creating #{achiy.name} \' policies..."
achiy_vegan = BrandPolicy.new(
            brand_id: achiy.id,
            policy_id: vegan.id,
            ranking: 5 )
achiy_vegan.save
puts "Created #{achiy.name} #{vegan.title}\'s policy."
achiy_organic = BrandPolicy.new(
            brand_id: achiy.id,
            policy_id: organic.id,
            ranking: 5)
achiy_organic.save
puts "Created #{achiy.name} #{organic.title}\'s policy."
achiy_fair_trade = BrandPolicy.new(
            brand_id: achiy.id,
            policy_id: fair_trade.id,
            ranking: 3)
achiy_fair_trade.save
puts "Created #{achiy.name} #{fair_trade.title}\'s policy."
achiy_good_cause = BrandPolicy.new(
            brand_id: achiy.id,
            policy_id: good_cause.id,
            ranking: 2)
achiy_good_cause.save
puts "Created #{achiy.name} #{good_cause.title}\'s policy."
achiy_co_2 = BrandPolicy.new(
            brand_id: achiy.id,
            policy_id: co_2.id,
            ranking: 3)
achiy_co_2.save
puts "Created #{achiy.name} #{co_2.title}\'s policy."

file_mhw = URI.open('https://res.cloudinary.com/dr8v0dbbd/image/upload/v1623316144/brands/mahemp_rsljis.jpg')
ma_hemp_wear = Brand.create(
      name: 'MÁ Hemp Wear',
      address: 'Holstentwiete 17, 22763 Hamburg',
      description: 'MÁ Hemp Wear is a sustainable clothing brand that delivers refined urban clothing made from hemp. MÁ Hemp Wear brings together a  unique mix of clever design elements and fine minimalism. ',
      status: "Accepted"
)
ma_hemp_wear.photo.attach(io: file_mhw, filename: 'mhw.jpg', content_type: 'image/jpg')
ma_hemp_wear.save
puts "Created brand #{ma_hemp_wear.id}. #{ma_hemp_wear.name}"

puts "Creating #{ma_hemp_wear.name} \' policies..."
ma_hemp_wear_vegan = BrandPolicy.new(
            brand_id: ma_hemp_wear.id,
            policy_id: vegan.id,
            ranking: 5 )
ma_hemp_wear_vegan.save
puts "Created #{ma_hemp_wear.name} #{vegan.title}\'s policy."
ma_hemp_wear_organic = BrandPolicy.new(
            brand_id: ma_hemp_wear.id,
            policy_id: organic.id,
            ranking: 5)
ma_hemp_wear_organic.save
puts "Created #{ma_hemp_wear.name} #{organic.title}\'s policy."
ma_hemp_wear_fair_trade = BrandPolicy.new(
            brand_id: ma_hemp_wear.id,
            policy_id: fair_trade.id,
            ranking: 3)
ma_hemp_wear_fair_trade.save
puts "Created #{ma_hemp_wear.name} #{fair_trade.title}\'s policy."
ma_hemp_wear_good_cause = BrandPolicy.new(
            brand_id: ma_hemp_wear.id,
            policy_id: good_cause.id,
            ranking: 2)
ma_hemp_wear_good_cause.save
puts "Created #{ma_hemp_wear.name} #{good_cause.title}\'s policy."
ma_hemp_wear_co_2 = BrandPolicy.new(
            brand_id: ma_hemp_wear.id,
            policy_id: co_2.id,
            ranking: 3)
ma_hemp_wear_co_2.save
puts "Created #{ma_hemp_wear.name} #{co_2.title}\'s policy."

puts " #{Brand.count} brands created"

# puts "Creating 10 brands..."
# puts " 20 brands created"

puts "creating 50 users"

50.times do |i|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "123456"
  )
end
puts "created 50 users"
puts "create 500 reviews"
User.all.find_each do |user|
  10.times do |x|
    brand = Brand.find(rand(1..20))
    quotes = [Faker::Quotes::Shakespeare.as_you_like_it_quote, Faker::Quotes::Shakespeare.hamlet_quote, Faker::Quotes::Shakespeare.king_richard_iii_quote, Faker::Quotes::Shakespeare.romeo_and_juliet_quote]
    Review.create(
      content: quotes.sample,
      rating: rand(2..5),
      brand_id: brand.id,
      user: user,
    )
    puts"review done"
  end
end
# brand = Brand.find(rand(1..10))
# review = Review.create(
#   content: Faker::Quotes::Shakespeare.as_you_like_it_quote,
#   review: rand(1..5)
# )
