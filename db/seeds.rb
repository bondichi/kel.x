# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creating the survey
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