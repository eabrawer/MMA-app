class FightCard < ActiveRecord::Base
	belongs_to :user
	has_many :fights
  	accepts_nested_attributes_for :fights
end
