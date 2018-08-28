require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'db/kelx-all-products.csv'

puts "Creating 5 brands"

 Brand.create(name: 'POLO RALPH LAUREN')
 Brand.create(name: 'NEW LOOK')
 Brand.create(name: 'PULL & BEAR')
 Brand.create(name: 'FARAH')
 Brand.create(name: 'BURTON')

CSV.foreach(filepath, csv_options) do |row|
  puts "Making a Product"
  Product.create!(
  vpn: row['vpn'],
  style: row['style'],
  sku: row['sku'],
  barcode: 0,
  size: row['size'],
  neck_circumference: row['neck_circumference'].to_i,
  shoulder_width: row['shoulder_width'].to_i,
  arm_length: row['arm_length'].to_i,
  center_back: row['center_back'].to_i,
  chest_width: row['chest_width'].to_i,
  waist_circumference: 0,
  inner_leg: row['inner_leg'].to_i,
  outer_leg: row['outer_leg'].to_i,
  thigh_circumference: row['thigh_circumference'].to_i,
  glutes: row['glutes'].to_i,
  cost_price: row['cost_price'].to_i,
  rrp: row['rrp'].to_i,
  sale_price: row['sale_price'].to_i,
  photo_id: 0,
  brand_id: row['brand_id'].to_i,
  created_at: 0,
  updated_at: 0,
  description: row['description'],
  category: row['category'],
  cost_price_cents: row['cost_price_cents'],
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

q1 = Question.new(content: {type: "selection", question: "Which of these brands fits you best in a long sleeve dress shirt?", option_type: 'image', options: [["logo_pull_and_bear.png", 1], ["logo_new_look.png", 2], ["logo_ralph_lauren.png", 3]] })
q2 = Question.new(content: {type: "selection", question: "Which size would you usually wear in your chosen brand?", option_type: 'text', options: [["XS", 1], ["S", 2], ["M", 3], ["L", 4], ["XL", 5], ["XL", 6], ["XXL", 7], ["XXXL", 8], ["4XL", 9], ["5XL", 10]] })
q3 = Question.new(content: {type: "selection", question: "Which fit do you usually like to wear in a shirt?", option_type: 'image', options: [["slim.png", 1], ["tailored.png", 2], ["standard.png", 3]] })
q4 = Question.new(content: {type: "selection", question: "Which style to do prefer?", option_type: 'image', options: [["smart.jpg", 1], ["smart-casual.jpg", 2], ["casual.png", 3]] })
q5 = Question.new(content: {type: "selection", question: "How would you categorise your skin tone?", option_type: 'image', options: [["tone1", 1], ["tone2", 2], ["tone3", 3], ["tone4", 4], ["tone5", 5], ["tone6", 6]] })
q6 = Question.new(content: {type: "selection", question: "Are there any issues you usually have with shirts?", option_type: 'text', options: [["Shirt collar too tight", 1], ["Shirt collar too loose", 2], ["Shirt length too long", 3], ["Shirt length too short", 4], ["Shirt sleeve too long", 5], ["Shirt sleeves too short", 6], ["Shirt sleeves too tight", 7], ["Shirt body too loose", 8], ["Shirt body too tight", 9], ["No Issues", 10]] })
q7 = Question.new(
  content: {
    type: "selection",
    question: "Are there any colours you wouldn't wear?",
    option_type: 'image',
    options: [
      ["black-dark.png", 1, {
        rules: {
          main_colour: {
            excludes: ['black', 'navy']
          }
        }
      }],
      ["very-pale.png", 2, {
        rules: {
          main_colour: {
            excludes: ['white', 'sand', 'lilac']
          }
        }
      }],
      ["very-bright.png", 3, {
        rules: {
          main_colour: {
            excludes: ['pink', 'lilac', 'sand','red']
          }
        }
      }],
      ["neutrals.png", 4, {
        rules: {
          main_colour: {
            excludes: ['maroon', 'sand']
          }
        }
      }],
      ["pastel.png", 5, {
        rules: {
          main_colour: {
            excludes: ['lilac', 'light-blue', 'pink' ]
          }
        }
      }],
      ["none.png", 6, {
        rules: {
          main_colour: {
            excludes: []
          }
        }
      }]
    ]
  }
)

q8 = Question.new(
  content: {
    type: "selection",
    question: "How much would you spend on a shirt?",
    option_type: 'text',
    options: [
      ["$20-50", 1, {
        rules: {
          sale_price_cents: {
            greater: 2000,
            lesser: 5000
          }
        }
      }],
      ["$50-$100", 2, {
        rules: {
          sale_price_cents: {
            greater: 5000,
            lesser: 10000
          }
        }
      }],
      ["$100-150", 3, {
        rules: {
          sale_price_cents: {
            greater: 100000,
            lesser: 150000
          }
        }
      }],
      ["$150 +", 4, {
        rules: {
          sale_price_cents: {
            greater: 150000,
            lesser: 1000000
          }
        }
      }]
    ]
  }
)

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

