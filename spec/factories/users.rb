# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	username "Thor"
  	email "thor@gmail.com"
  	password "thor"
  	password_confirmation "thor"
  	losses 0
  	wins 0
  	silver 0
  end
end
