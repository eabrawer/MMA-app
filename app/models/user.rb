class User < ActiveRecord::Base
	has_secure_password
	has_many :fight_cards
	# has_many :fights, through: :fight_cards

	def email=(value)
		value = value.strip.downcase
		write_attribute :email, value
	end

end
