# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	username "Thor"
  	email "josh@gmail.com"
  	password "agentsmith"
  	password_confirmation "agentsmith"
  	losses 0
  	wins 0
  	silver 0
  end
end