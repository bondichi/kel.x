require 'csv'

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath    = 'db/kelx-all-products.csv'

# puts "Creating 5 brands"

#  Brand.create(name: 'POLO RALPH LAUREN')
#  Brand.create(name: 'NEW LOOK')
#  Brand.create(name: 'PULL & BEAR')
#  Brand.create(name: 'FARAH')
#  Brand.create(name: 'BURTON')

# CSV.foreach(filepath, csv_options) do |row|
#   puts "Making a Product"
#   Product.create!(
#   vpn: row['vpn'],
#   style: row['style'],
#   sku: row['sku'],
#   barcode: 0,
#   size: row['size'],
#   neck_circumference: row['neck_circumference'].to_i,
#   shoulder_width: row['shoulder_width'].to_i,
#   arm_length: row['arm_length'].to_i,
#   center_back: row['center_back'].to_i,
#   chest_width: row['chest_width'].to_i,
#   waist_circumference: 0,
#   inner_leg: row['inner_leg'].to_i,
#   outer_leg: row['outer_leg'].to_i,
#   thigh_circumference: row['thigh_circumference'].to_i,
#   glutes: row['glutes'].to_i,
#   cost_price: row['cost_price'].to_i,
#   rrp: row['rrp'].to_i,
#   sale_price: row['sale_price'].to_i,
#   photo_id: 0,
#   brand_id: row['brand_id'].to_i,
#   created_at: 0,
#   updated_at: 0,
#   description: row['description'],
#   category: row['category'],
#   cost_price_cents: row['cost_price_cents'],
#   rrp_cents: row['rrp_cents'].to_i,
#   sale_price_cents: row['sale_price_cents'].to_i,
#   vendor: row['vendor'],
#   style_number: row['style_number'],
#   size_code: row['size_code'],
#   sub_category: row['sub_category'],
#   fabric_composition: row['fabric_composition'],
#   silhouette: row['silhouette'],
#   main_colour: row['main_colour'],
#   print_wash: row['print_wash'],
#   remote_photo_url: row['remote_photo_url'])
# end

puts "Deleting previous survey and question seeds"

Answer.destroy_all
SurveyResponse.destroy_all
Question.destroy_all
Survey.destroy_all

puts "Creating the Onboarding Survey"

survey = Survey.create(name: "Onboarding")

puts "Creating Questions"

shirts_size_question_1 = Question.new(
  content: {
    type: "selection",
    header: "Let's Gauge Your Size - Shirts",
    question: "Which of these brands fits you best in a long sleeve dress shirt?",
    explanation: "We will use the garment specifications to begin our calibration of your Kelx Tailored-Size",
    option_type: 'image',
    options: [
      ["logo_pull_and_bear.png", 1],
      ["logo_new_look.png", 2],
      ["logo_ralph_lauren.png", 3],
      ["farah-logo-png.svg", 4],
      ["logo_burton.png", 5]
    ]
  }
)

shirts_size_question_2 = Question.new(
  content: {
    type: "selection",
    header: "Let's Gauge Your Size - Shirts",
    explanation: "We will use the garment specifications to begin our calibration of your Kelx Tailored-Size",
    question: "Which size would you usually wear in this brand?",
    option_type: 'text',
    options: [
      ["XS", 1],
      ["S", 2],
      ["M", 3],
      ["L", 4],
      ["XL", 5],
      ["XL", 6],
      ["2XL", 7],
      ["3XL", 8]
    ]
  }
)

shirts_size_question_3 = Question.new(
  content: {
    type: "selection",
    header: "Shirt Gripes",
    explanation: "Knowing this will help us adjust your Kelx Tailored-Size?",
    question: "Are there any issues you usually have with shirts?",
    option_type: 'text',
    options: [
      ["Collar too tight", 1],
      ["Collar too loose", 2],
      ["Length too long", 3],
      ["Length too short", 4],
      ["Sleeves too long", 5],
      ["Sleeves too short", 6],
      ["Sleeves too tight", 7],
      ["Body too loose", 8],
      ["Body too tight", 9],
      ["No Issues", 10]
    ]
  }
)

pants_size_question_1 = Question.new(
  content: {
    type: "selection",
    header: "Let's Gauge Your Size - Pants",
    question: "Which of these brands fits you best in a long pants?",
    explanation: "We will use the garment specifications to begin our calibration of your Kelx Tailored-Size",
    option_type: 'image',
    options: [
      ["logo_pull_and_bear.png", 1],
      ["logo_new_look.png", 2]
    ]
  }
)

pants_size_question_2 = Question.new(
  content: {
    type: "selection",
    header: "Let's Gauge Your Size - Pants",
    explanation: "We will use the garment specifications to begin our calibration of your Kelx Tailored-Size",
    question: "Which size would you usually wear in this brand?",
    option_type: 'text',
    options: [
      ["W26 L30", 1],
      ["W26 L32", 2],
      ["W28 L30", 3],
      ["W28 L32", 4],
      ["W29 L30", 5],
      ["W29 L32", 6],
      ["W30 L30", 7],
      ["W30 L32", 8],
      ["W30 L34", 9],
      ["W31 L30", 10],
      ["W31 L32", 11],
      ["W31 L34", 12],
      ["W32 L30", 13],
      ["W32 L32", 14],
      ["W32 L34", 15],
      ["W33 L30", 16],
      ["W33 L32", 17],
      ["W33 L34", 18],
      ["W34 L30", 19],
      ["W34 L32", 20],
      ["W34 L34", 21],
      ["W36 L32", 22],
      ["W36 L34", 23],
      ["W38 L32", 24],
      ["W38 L34", 25]
    ]
  }
)

pants_size_question_3 = Question.new(
  content: {
    type: "selection",
    header: "Pants Gripes",
    explanation: "Knowing this will help us adjust your Kelx Tailored-Size?",
    question: "Are there any issues you usually have with pants?",
    option_type: 'text',
    options: [
      ["Thigh too tight", 1],
      ["Thigh too loose", 2],
      ["Waist too tight", 3],
      ["Waist too loose", 4],
      ["Glutes too tight", 5],
      ["Glutes too loose", 6],
      ["Leg too long", 7],
      ["Leg too short", 8],
      ["No Issues", 9]
    ]
  }
)

style_question_1 = Question.new(
  content: {
    type: "selection",
    header: "What's your Style?",
    explanation: "The type of garment cut your prefer will also influence your size",
    question: "Which fit do you usually like to wear in a shirt?",
    option_type: 'image',
    options: [
      ["slim.png", 1],
      ["tailored.png", 2],
      ["standard.png", 3]
    ]
  }
)

style_question_2 = Question.new(
  content: {
    type: "selection",
    header: "What's your Style?",
    explanation: "The type of garment cut your prefer will also influence your size",
    question: "Which fit do you usually like to wear in a pants",
    option_type: 'image',
    options: [
      ["skinny_pants.png", 1],
      ["slim_pants.png", 2],
      ["regular_pants.png", 3] #add images for pants cuts
    ]
  }
)

style_question_3 = Question.new(
  content: {
    type: "selection",
    header: "What's your Style?",
    explanation: "How hip is your work?",
    question: "Which style would you normally wear to work?",
    option_type: 'image',
    options: [
      ["work_wear_suit.png", 1],
      ["work_wear_smart_casual.png", 2],
      ["work_wear_casual.png", 3] # change images to Kelly's
    ]
  }
)

style_question_4 = Question.new(
  content: {
    type: "selection",
    header: "What's your Style?",
    explanation: "We will use this as guide for our personal styling",
    question: "Which style would you wear in your free time?",
    option_type: 'image',
    options: [
      ["work_wear_smart_casual.png", 1],
      ["classic_casual_wknd.png", 2],
      ["laid_back_casual.png", 3] # change images to Kelly's
    ]
  }
)

style_question_5 = Question.new(
  content: {
    type: "selection",
    header: "What's your Style?",
    explanation: "We will use this as guide for our personal styling",
    question: "Are there any colours you prefer not to wear?",
    option_type: 'image',
    options: [
      ["dark_colour.png", 1, {
        rules: {
          main_colour: {
            excludes: ['black', 'navy']
          }
        }
      }],
      ["very_pale_colour.png", 2, {
        rules: {
          main_colour: {
            excludes: ['white', 'sand', 'lilac']
          }
        }
      }],
      ["bright_colour.png", 3, {
        rules: {
          main_colour: {
            excludes: ['pink', 'lilac', 'sand','red']
          }
        }
      }],
      ["neutral_colour.png", 4, {
        rules: {
          main_colour: {
            excludes: ['maroon', 'sand']
          }
        }
      }],
      ["none.png", 5, {
        rules: {
          main_colour: {
            excludes: []
          }
        }
      }]
    ]
  }
)

budget_question_1 = Question.new(
  content: {
    type: "selection",
    header: "Budget",
    explanation: "We will recommend pieces in withing your limits",
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

budget_question_2 = Question.new(
  content: {
    type: "selection",
    header: "Budget",
    explanation: "We will recommend pieces in withing your limits",
    question: "How much would you spend on a pants?",
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
            greater: 2000,
            lesser: 10000
          }
        }
      }],
      ["$100-150", 3, {
        rules: {
          sale_price_cents: {
            greater: 2000,
            lesser: 150000
          }
        }
      }],
      ["$150 +", 4, {
        rules: {
          sale_price_cents: {
            greater: 2000,
            lesser: 1000000
          }
        }
      }]
    ]
  }
)

shirts_size_question_1.survey = survey
shirts_size_question_1.save!

shirts_size_question_2.survey = survey
shirts_size_question_2.save!

shirts_size_question_3.survey = survey
shirts_size_question_3.save!

pants_size_question_1.survey = survey
pants_size_question_1.save!

pants_size_question_2.survey = survey
pants_size_question_2.save!

pants_size_question_3.survey = survey
pants_size_question_3.save!

style_question_1.survey = survey
style_question_1.save!

style_question_2.survey = survey
style_question_2.save!

style_question_3.survey = survey
style_question_3.save!

style_question_4.survey = survey
style_question_4.save!

style_question_5.survey = survey
style_question_5.save!

budget_question_1.survey = survey
budget_question_1.save!

budget_question_2.survey = survey
budget_question_2.save!

