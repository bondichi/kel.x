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

q1 = Question.new(content: {type: "selection", question: "Which of these brands fits you best in a long sleeve dress shirt?", options: [["Polo Ralph Lauren", 1], ["Pull & Bear", 2], ["New Look", 3]] })
q2 = Question.new(content: {type: "selection", question: "Which size would you usually wear in your chosen brand?", options: [["XS", 1], ["S", 2], ["M", 3], ["L", 4], ["XL", 5], ["XL", 6], ["XXL", 7], ["XXXL", 8], ["4XL", 9], ["5XL", 10]] })
q3 = Question.new(content: {type: "selection", question: "Which fit do you usually like to wear in a shirt?", options: [["Slim", 1], ["Tailored", 2], ["Standard", 3]] })
q4 = Question.new(content: {type: "selection", question: "Which style to do prefer?", options: [["Smart", 1], ["Smart-Casual", 2], ["Casual", 3]] })
q5 = Question.new(content: {type: "selection", question: "How would you categorise your skin tone?", options: [["Very Fair", 1], ["Fair", 2], ["Medium - Olive", 3], ["Olive - Moderate Brown", 4], ["Medium Brown - Dark Brown", 5], ["Dark Brown", 6], ["Very Dark Brown- Black", 7]] })
q6 = Question.new(content: {type: "selection", question: "Are there any issues you usually have with shirts?", options: [["Shirt collar too tight", 1], ["Shirt collar too loose", 2], ["Shirt length too long", 3], ["Shirt length too short", 4], ["Shirt sleeve too long", 5], ["Shirt sleeves too short", 6], ["Shirt sleeves too tight", 7], ["Shirt body too loose", 8], ["Shirt body too tight", 9], ["No Issues", 10]] })
q7 = Question.new(content: {type: "selection", question: "Are there any colours you don't like to wear?", options: [["Black and very dark shades", 1], ["White & very pale colours", 2], ["Very bright shades", 3], ["Neutrals / earth tones", 4], ["Pastel shades - pale pink, lilac", 5],["None", 6]]})
q8 = Question.new(content: {type: "selection", question: "How much would you spend on a shirt?", options: [["$20-50", 1], ["$50-$100", 2], ["$100-150", 3], ["$150 +", 4]] })

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

q7.survey = survey
q7.save!

q8.survey = survey
q8.save!

