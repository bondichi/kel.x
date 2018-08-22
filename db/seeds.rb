# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creating the survey

product1 = Product.new(
  vpn: "1314784",
  style: "WORK",
  sku: "S18100100105",
  barcode: 0,
  size: "M",
  neck_circumference: 0,
  shoulder_width: 0,
  arm_length: 0,
  center_back: 0,
  chest_width: 0,
  waist_circumference: 0,
  inner_leg: 0,
  outer_leg: 0,
  thigh_circumference: 0,
  glutes: 0,
  cost_price: 0,
  rrp: 0,
  sale_price: 0,
  photo_id: 0,
  brand_id: 0,
  created_at: 0,
  updated_at: 0,
  description: "Polo Ralph Lauren slim fit gingham poplin shirt player logo button down in green/white",
  category: "TOPS",
  cost_price_cents: 0,
  rrp_cents: 0,
  sale_price_cents: 0,
  vendor: "ASOS",
  style_number: "S181001001",
  size_code: "05",
  sub_category: "",
  fabric_composition: "100%' 'cotton",
  silhouette: "slim",
  main_colour: "green",
  print_wash: "gingham",
  remote_photo_url: "https://images.asos-media.com/products/polo-ralph-lauren-slim-fit-gingham-poplin-shirt-player-logo-button-down-in-green-white/10233316-1-evergreenwhite?$XXL$&wid=513&fit=constrain",
  )

puts "Creating the Onboarding Survey"

survey = Survey.create(name: "Onboarding")

puts "Creating Questions"

q1 = Question.new(content: {type: "standard", question: "What is your favourite style"})
q2 = Question.new(content: {type: "standard", question: "What piece of clothing do you need the most"})
q3 = Question.new(content: {type: "standard", question: "What colours do you prefer to wear"})
q4 = Question.new(content: {type: "standard", question: "Do you have any upcoming events to get dressed for"})
q5 = Question.new(content: {type: "standard", question: "How casula is your work attire "})

q1.survey = survey
q1.save!

q2.survey = survey
q2.save!

q2.survey = survey
q2.save!

q3.survey = survey
q3.save!

q4.survey = survey
q4.save!

q5.survey = survey
q5.save!
