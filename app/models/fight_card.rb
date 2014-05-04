class FightCard < ActiveRecord::Base
	belongs_to :user
	has_many :fights
  	accepts_nested_attributes_for :fights, 
  	:allow_destroy => true, 
  	:reject_if => proc { |att| att['name'].blank? }
end
