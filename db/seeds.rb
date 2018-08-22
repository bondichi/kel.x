require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'db/products.csv'

puts "Creating 3 brands"

 Brand.create(name: 'POLO RALPH LAUREN')
 Brand.create(name: 'NEW LOOK')
 Brand.create(name: 'PULL & BEAR')

CSV.foreach(filepath, csv_options) do |row|
  puts "Making a Product"
  Product.create!(
  vpn: row['vpn'],
  style: row['style'],
  sku: row['sku'],
  barcode: 0,
  size: row['size'],
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
  rrp: row['rrp'].to_i,
  sale_price: 0,
  photo_id: 0,
  brand_id: row['brand_id'].to_i,
  created_at: 0,
  updated_at: 0,
  description: row['description'],
  category: row['category'],
  cost_price_cents: 0,
  rrp_cents: row['rrp_cents'].to_i,
  sale_price_cents: row['sale_price_cents'].to_i,
  vendor: row['vendor'],
  style_number: row['style_number'],
  size_code: row['size_code'],
  sub_category: row['sub_category'],
  fabric_composition: row['fabric_composition'],
  silhouette: row['silhouette'],
  main_colour: row['main_colour'],
  print_wash: row['print_wash'],
  remote_photo_url: row['remote_photo_url'])
end

puts "Deleting previous survey and question seeds"

Answer.destroy_all
SurveyResponse.destroy_all
Question.destroy_all
Survey.destroy_all

puts "Creating the Onboarding Survey"

survey = Survey.create(name: "Onboarding")

puts "Creating Questions"

q1 = Question.new(content: {type: "standard", question: "What is your favourite style?"})
q2 = Question.new(content: {type: "standard", question: "What piece of clothing do you need the most?"})
q3 = Question.new(content: {type: "standard", question: "What colours do you prefer to wear?"})
q4 = Question.new(content: {type: "standard", question: "Do you have any upcoming events to get dressed for?"})
q5 = Question.new(content: {type: "selection", question: "How casual is your work attire?", options: [["Professional", 1], ["Smart Casual", 2], ["Casual", 3]] })
q6 = Question.new(content: {type: "selection", question: "What colour wouldn't you wear?", options: [["Pink", 1], ["White", 2], ["Tan", 3]] })


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

q6.survey = survey
q6.save!
