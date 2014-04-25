class User < ActiveRecord::Base
	has_secure_password
	has_many :fight_cards
	accepts_nested_attributes_for :fight_cards

	def email=(value)
		value = value.strip.downcase
		write_attribute :email, value
	end

end
